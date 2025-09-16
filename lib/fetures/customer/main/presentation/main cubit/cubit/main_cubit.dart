import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/enums/nav_bar_enums.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  NavBarEnum selectedNavBar = NavBarEnum.home;

  void selectNavBarIcon({required NavBarEnum navBarEnum}) {
    if (navBarEnum == NavBarEnum.profile) {
      selectedNavBar = NavBarEnum.profile;
    } else if (navBarEnum == NavBarEnum.home) {
      selectedNavBar = NavBarEnum.home;
    } else if (navBarEnum == NavBarEnum.notifications) {
      selectedNavBar = NavBarEnum.notifications;
    } else if (navBarEnum == NavBarEnum.chart) {
      selectedNavBar = NavBarEnum.chart;
    } else if (navBarEnum == NavBarEnum.favorites) {
      selectedNavBar = NavBarEnum.favorites;
    }

    emit(IsSelectedIconState(navBarEnum: selectedNavBar));
  }
}
