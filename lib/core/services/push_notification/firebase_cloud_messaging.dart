import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class FirebaseCloudMessaging {
  static final FirebaseCloudMessaging _instance =
      FirebaseCloudMessaging._internal();
  factory FirebaseCloudMessaging() => _instance;
  FirebaseCloudMessaging._internal();

  static const String _fcmEndpoint =
      'https://fcm.googleapis.com/v1/projects/shopi-aabfa/messages:send';

  AccessCredentials? _credentials;

  Future<void> _loadAccessToken() async {
    if (_credentials != null && _credentials!.accessToken.hasExpired == false) {
      return;
    }

    final jsonString = await rootBundle.loadString(
      'assets/notification/shopi-aabfa-93ed54478d1e.json',
    );
    final serviceAccount = json.decode(jsonString);

    final accountCredentials = ServiceAccountCredentials.fromJson(
      serviceAccount,
    );

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    _credentials = await obtainAccessCredentialsViaServiceAccount(
      accountCredentials,
      scopes,
      http.Client(),
    );
  }

  /// Send to topic — now returns Dio Response
  Future<Response> sendTopicNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
    required String topic,
  }) async {
    await _loadAccessToken();

    final payload = {
      "message": {
        "topic": topic, // مهم: تحدد الـ target
        "notification": {"title": title, "body": body},
        // عند الـ HTTP v1 لازم تبقى قيم الـ data strings غالباً
        "data": (data ?? {}).map((k, v) => MapEntry(k, v.toString())),
      },
    };

    final response = await Dio().post(
      _fcmEndpoint,
      data: json.encode(payload),
      options: Options(
        validateStatus: (_) => true,
        headers: {
          'Authorization': 'Bearer ${_credentials!.accessToken.data}',
          'Content-Type': 'application/json',
        },
      ),
    );

    // يمكنك فحص response.statusCode هنا و ترمي خطأ لو فشل
    if (response.statusCode != 200) {
      throw Exception(
        'FCM send failed: ${response.statusCode} - ${response.data}',
      );
    }

    return response;
  }

  // اختياري: لو بتستخدم sendToTokens خليها ترجّع Response كمان
  Future<List<Response>> sendToTokens({
    required List<String> tokens,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    await _loadAccessToken();
    final responses = <Response>[];

    for (final token in tokens) {
      final payload = {
        "message": {
          "token": token,
          "notification": {"title": title, "body": body},
          "data": (data ?? {}).map((k, v) => MapEntry(k, v.toString())),
        },
      };

      final response = await Dio().post(
        _fcmEndpoint,
        data: json.encode(payload),
        options: Options(
          validateStatus: (_) => true,
          headers: {
            'Authorization': 'Bearer ${_credentials!.accessToken.data}',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'FCM send to token failed: ${response.statusCode} - ${response.data}',
        );
      }

      responses.add(response);
    }

    return responses;
  }
}
