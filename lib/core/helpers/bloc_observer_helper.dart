// lib/core/bloc/app_bloc_observer.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// App-wide BlocObserver that logs and handles:
/// - Cubit state changes (onChange)
/// - Bloc transitions (onTransition)
/// - Events (onEvent) for Bloc
/// - Errors (onError)
/// - Creation & Close (onCreate/onClose)
///
/// Customize: replace _log(...) with integration to Crashlytics / Sentry / remote logger.
class BlocObserverHelper extends BlocObserver {
  final bool verbose;

  const BlocObserverHelper({this.verbose = true});

  // central place to send logs (stdout / remote / analytics)
  void _log(String tag, Object? message, [StackTrace? st]) {
    final time = DateTime.now().toIso8601String();
    if (st != null) {
      // You can send this to Crashlytics or Sentry here.
      debugPrint('[$time] [$tag] $message\n$st');
    } else {
      debugPrint('[$time] [$tag] $message');
    }
    // Example: Crashlytics / Sentry integration point:
    // if (shouldReport) Crashlytics.instance.recordError(message, st);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _log('CREATE', '${bloc.runtimeType} created');
  }

  @override
  void onClose(BlocBase bloc) {
    _log('CLOSE', '${bloc.runtimeType} closed');
    super.onClose(bloc);
  }

  // For Cubit: captures state changes (previous -> current)
  @override
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (verbose) {
      _log(
        'CHANGE',
        '${bloc.runtimeType} | prev: ${_short(change.currentState)} -> curr: ${_short(change.nextState)}',
      );
    } else {
      _log('CHANGE', '${bloc.runtimeType} -> ${_short(change.nextState)}');
    }
  }

  // For Bloc (Event -> Transition<State>)
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _log('EVENT', '${bloc.runtimeType} | event: ${_short(event)}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _log(
      'TRANSITION',
      '${bloc.runtimeType} | ${_short(transition.event)} '
          '=> ${_short(transition.currentState)} -> ${_short(transition.nextState)}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // Always call super so default behavior remains
    super.onError(bloc, error, stackTrace);

    // Log error and optionally report to error-tracking service
    _log('ERROR', '${bloc.runtimeType} | $error', stackTrace);

    // Example: send to Sentry/Crashlytics here
    // Sentry.captureException(error, stackTrace: stackTrace);
  }

  // Helper to avoid huge prints: shorten common objects
  String _short(Object? o) {
    if (o == null) return 'null';
    final s = o.toString();
    // If it's long, truncate but keep class name
    if (s.length > 150) {
      // try to include runtimeType info if available
      return '${o.runtimeType}(${s.substring(0, 120)}... )';
    }
    return s;
  }
}
