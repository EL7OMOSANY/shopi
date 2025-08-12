abstract class AppState {}

class AppInitialState extends AppState {}

class AppThemeChangeed extends AppState {
  final bool sharedTheme;
  AppThemeChangeed({required this.sharedTheme});
}
