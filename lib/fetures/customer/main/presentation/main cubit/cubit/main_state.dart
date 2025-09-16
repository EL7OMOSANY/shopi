part of 'main_cubit.dart';

sealed class MainState {}

final class MainInitial extends MainState {}

final class IsSelectedIconState extends MainState {
  NavBarEnum navBarEnum;
  IsSelectedIconState({required this.navBarEnum});
}
