import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/customer/fetures/home/data/repo/banners_repo.dart';

part 'customer_home_state.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  CustomerHomeCubit(this._repo) : super(CustomerHomeInitial());

  final CustomerHomeRepos _repo;

  List<String> bannersImageList = [];

  Future<void> getBanners() async {
    emit(CustomerHomeBannersLoading());

    try {
      final result = await _repo.getBanners();
      result.when(
        success: (data) {
          bannersImageList = data.bannerImageList;
          if (bannersImageList.isEmpty) {
            emit(CustomerHomeBannersFailure("No Banners Found"));
            return;
          }
          emit(CustomerHomeBannersSuccess(data.bannerImageList));
        },
        failure: (error) {
          emit(CustomerHomeBannersFailure(error));
        },
      );
    } catch (error) {
      emit(CustomerHomeBannersFailure(error.toString()));
    }
  }
}
