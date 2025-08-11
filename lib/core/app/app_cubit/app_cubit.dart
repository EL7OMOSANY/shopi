import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true;

  String currentLangCode = 'en';

  //Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(SharedPrefKeys.isDark, isDark).then((
        value,
      ) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }
}
