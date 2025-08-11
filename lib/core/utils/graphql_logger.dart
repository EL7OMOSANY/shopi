import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class GraphQLLogger {
  // ANSI escape codes for colors
  static const String _reset = '\x1B[0m';
  static const String _green = '\x1B[32m';
  static const String _blue = '\x1B[34m';
  static const String _yellow = '\x1B[33m';
  static const String _red = '\x1B[31m';
  static const String _cyan = '\x1B[36m';
  static const String _magenta = '\x1B[35m';
  static const String _bold = '\x1B[1m';
  static const String _underline = '\x1B[4m';
  static const String _italic = '\x1B[3m';

  // Box drawing characters for prettier borders
  static const String _boxTopLeft = '┌';
  static const String _boxTopRight = '┐';
  static const String _boxBottomLeft = '└';
  static const String _boxBottomRight = '┘';
  static const String _boxHorizontal = '─';
  static const String _boxVertical = '│';

  /// Method to print full tokens without truncation
  static void printFullToken(String token, {String? prefix}) {
    if (!kDebugMode) return;

    final displayPrefix = prefix != null ? '$prefix: ' : '[TOKEN] ';

    // Create a decorated box for the token
    const boxWidth = 80;
    const tokenHeader = '$_bold$_blue Token $_reset';

    _printBoxTop(tokenHeader, boxWidth);

    // Use developer.log to print the token without truncation
    developer.log('$_boxVertical $_cyan$displayPrefix$_reset$token');

    // Print token info in a pretty box
    debugPrint(
        '$_boxVertical $_bold Token Length: $_yellow${token.length}$_reset characters');

    // Some token visualization (first and last few characters)
    if (token.length > 10) {
      final start = token.substring(0, 5);
      final end = token.substring(token.length - 5);
      debugPrint(
          '$_boxVertical $_italic Preview: $_green$start$_reset ... $_green$end$_reset');
    }

    _printBoxBottom(boxWidth);
  }

  /// Alternative method that prints token in chunks for easier reading
  static void printTokenInChunks(String token, {int chunkSize = 100}) {
    if (!kDebugMode) return;

    const boxWidth = 100;
    const tokenHeader = '$_bold$_magenta Token Chunks $_reset';

    _printBoxTop(tokenHeader, boxWidth);

    // Print in chunks with fancy formatting
    for (int i = 0; i < token.length; i += chunkSize) {
      final int end = i + chunkSize < token.length ? i + chunkSize : token.length;
      final chunkNum = i ~/ chunkSize;
      final chunk = token.substring(i, end);

      final chunkPrefix =
          '$_boxVertical $_cyan$_bold Chunk #$chunkNum: $_reset';
      developer.log('$chunkPrefix$chunk');

      // Add separator between chunks
      if (end < token.length) {
        final separator = List.filled(boxWidth - 4, _boxHorizontal).join('');
        debugPrint('$_boxVertical$_blue$separator$_reset');
      }
    }

    // Token info
    debugPrint(_boxVertical);
    debugPrint(
        '$_boxVertical $_yellow$_bold Total length: ${token.length} characters$_reset');

    _printBoxBottom(boxWidth);
  }

  /// Method to print long strings without truncation
  static void printWithoutTruncation(String message) {
    if (!kDebugMode) return;

    // Use developer.log which doesn't truncate output
    developer.log(message);
  }

  static void logRequest(
      String operation, String query, Map<String, dynamic> variables) {
    if (!kDebugMode) return;

    const boxWidth = 80;
    final header = '$_bold$_blue GraphQL Request: $_underline$operation$_reset';

    _printBoxTop(header, boxWidth);

    debugPrint('$_boxVertical $_cyan$_bold QUERY:$_reset');
    debugPrint('$_boxVertical $_green${_formatQuery(query)}$_reset');

    if (variables.isNotEmpty) {
      debugPrint(_boxVertical);
      debugPrint('$_boxVertical $_cyan$_bold VARIABLES:$_reset');
      debugPrint('$_boxVertical $_magenta${_prettyJson(variables)}$_reset');
    }

    _printBoxBottom(boxWidth);
  }

  static void logResponse(dynamic response, Duration duration) {
    if (!kDebugMode) return;

    const boxWidth = 80;
    final header =
        '$_bold$_green Response (${duration.inMilliseconds}ms)$_reset';

    _printBoxTop(header, boxWidth);

    debugPrint('$_boxVertical $_cyan$_bold DATA:$_reset');
    debugPrint('$_boxVertical $_green${_prettyJson(response)}$_reset');

    _printBoxBottom(boxWidth);
  }

  static void logError(dynamic error, {StackTrace? stack}) {
    if (!kDebugMode) return;

    const boxWidth = 80;
    const header = '$_bold$_red GraphQL Error$_reset';

    _printBoxTop(header, boxWidth);

    debugPrint('$_boxVertical $_red$_bold ERROR:$_reset');
    debugPrint('$_boxVertical $_yellow$error$_reset');

    if (stack != null) {
      debugPrint(_boxVertical);
      debugPrint('$_boxVertical $_red$_bold STACK:$_reset');
      debugPrint('$_boxVertical $_yellow$stack$_reset');
    }

    _printBoxBottom(boxWidth);
  }

  // Keep track of the last logged token to avoid duplicates
  static String? _lastLoggedToken;
  static int _repeatCount = 0;

  static void logToken(String action, String tokenType, String? token) {
    if (!kDebugMode) return;

    if (token == null || token.isEmpty) {
      debugPrint('$_yellow$_boxVertical <empty token>$_reset');
      return;
    }

    // Check if this is the same token as the last one logged
    if (_lastLoggedToken == token) {
      // Just increment the counter and exit
      _repeatCount++;
      // Print a simple message instead
      debugPrint(
          '$_cyan$_italic Token used again: $_reset$_yellow$action$_reset($_repeatCount)');
      return;
    }

    // Reset counter for new token
    _repeatCount = 0;
    _lastLoggedToken = token;

    // Print the full token using dart:developer.log to avoid truncation
    developer.log('TOKEN: $token');

    const boxWidth = 80;
    final header = '$_bold$_magenta Token: $_underline$tokenType$_reset';

    _printBoxTop(header, boxWidth);

    debugPrint(
        '$_boxVertical $_cyan$_bold ACTION:$_reset $_cyan$action$_reset');
    debugPrint(
        '$_boxVertical $_cyan$_bold LENGTH:$_reset $_cyan${token.length} characters$_reset');

    // Token preview (first and last characters with ... in between)
    if (token.length > 30) {
      final start = token.substring(0, 15);
      final end = token.substring(token.length - 15);
      debugPrint(
          '$_boxVertical $_yellow$_bold PREVIEW:$_reset $_green$start$_reset...$_green$end$_reset');
    } else {
      debugPrint(
          '$_boxVertical $_yellow$_bold TOKEN:$_reset $_green$token$_reset');
    }

    // If it's a JWT token, try to show payload
    if (token.contains('.') && token.split('.').length == 3) {
      try {
        final parts = token.split('.');

        // Print JWT structure visualization
        debugPrint(_boxVertical);
        debugPrint('$_boxVertical $_magenta$_bold JWT STRUCTURE:$_reset');
        debugPrint(
            '$_boxVertical $_blue┌${"─" * 15}┬${"─" * 15}┬${"─" * 15}┐$_reset');
        debugPrint(
            '$_boxVertical $_blue│$_reset $_cyan Header$_reset${" " * 9}$_blue│$_reset $_yellow Payload$_reset${" " * 8}$_blue│$_reset $_green Signature$_reset${" " * 6}$_blue│$_reset');
        debugPrint(
            '$_boxVertical $_blue└${"─" * 15}┴${"─" * 15}┴${"─" * 15}┘$_reset');

        final payload = _decodeJwtPart(parts[1]);
        if (payload != null) {
          debugPrint(_boxVertical);
          debugPrint('$_boxVertical $_cyan$_bold JWT PAYLOAD:$_reset');
          debugPrint('$_boxVertical $_green${_prettyJson(payload)}$_reset');

          // Extract and show expiration time if available
          if (payload.containsKey('exp')) {
            final expTimestamp = payload['exp'] as int;
            final expDate =
                DateTime.fromMillisecondsSinceEpoch(expTimestamp * 1000);
            final now = DateTime.now();
            final remaining = expDate.difference(now);

            debugPrint(_boxVertical);
            debugPrint('$_boxVertical $_blue$_bold EXPIRES:$_reset');

            // Add visual indicator for token expiration
            final String expiryIndicator;
            if (remaining.isNegative) {
              expiryIndicator = '$_red[EXPIRED]$_reset';
            } else if (remaining.inHours < 1) {
              expiryIndicator = '$_red[EXPIRES SOON]$_reset';
            } else if (remaining.inHours < 24) {
              expiryIndicator = '$_yellow[EXPIRES TODAY]$_reset';
            } else {
              expiryIndicator = '$_green[VALID]$_reset';
            }

            debugPrint(
                '$_boxVertical $_blue${expDate.toIso8601String()} $expiryIndicator');
            debugPrint(
                '$_boxVertical $_blue(${remaining.inHours}h ${remaining.inMinutes % 60}m remaining)$_reset');
          }
        }
      } catch (e) {
        debugPrint(
            '$_boxVertical $_red$_bold ERROR DECODING JWT:$_reset $_red$e$_reset');
      }
    }

    _printBoxBottom(boxWidth);
  }

  // Helper for printing the top of a box
  static void _printBoxTop(String title, int width) {
    final titleLength = _stripAnsiCodes(title).length;
    final padding =
        width - titleLength - 4; // 4 accounts for the box characters and spaces

    final leftPadding = padding ~/ 2;
    final rightPadding = padding - leftPadding;

    final left = '$_boxTopLeft${_boxHorizontal * leftPadding}';
    final right = '${_boxHorizontal * rightPadding}$_boxTopRight';

    debugPrint('');
    debugPrint('$left $title $right');
  }

  // Helper for printing the bottom of a box
  static void _printBoxBottom(int width) {
    debugPrint(
        '$_boxBottomLeft${_boxHorizontal * (width - 2)}$_boxBottomRight');
    debugPrint('');
  }

  // Helper to strip ANSI color codes for length calculation
  static String _stripAnsiCodes(String text) {
    return text.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '');
  }

  static String _prettyJson(dynamic json) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json).split('\n').map((e) => '  $e').join('\n');
  }

  static String _formatQuery(String query) {
    return query.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  static Map<String, dynamic>? _decodeJwtPart(String part) {
    try {
      final normalized = _base64Normalize(part);
      final decoded = base64Decode(normalized);
      return json.decode(utf8.decode(decoded)) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  static String _base64Normalize(String input) {
    String output = input.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Invalid base64 string');
    }
    return output;
  }
}
