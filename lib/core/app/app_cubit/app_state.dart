import 'dart:ui';

abstract class AppState {}

class AppInitialState extends AppState {}

class AppThemeChangeed extends AppState {
  final bool sharedTheme;
  AppThemeChangeed({required this.sharedTheme});
}

class AppLanguageChangeed extends AppState {
  final Locale sharedLanguage;
  AppLanguageChangeed({required this.sharedLanguage});
}
