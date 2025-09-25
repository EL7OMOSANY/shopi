import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/hive/hive_database.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/customer/fetures/favorits/data/models/favorites_model.dart';

part 'customer_favorites_state.dart';

class CustomerFavoritesCubit extends Cubit<CustomerFavoritesState> {
  CustomerFavoritesCubit() : super(CustomerFavoritesInitial());

  /// إضافة أو حذف من المفضلة
  Future<void> manageFavourites(ProductModel product) async {
    final box = HiveDatabase().favoritesBox!;

    final existingIndex = box.values.toList().indexWhere(
      (e) => e.id == product.id,
    );

    if (existingIndex >= 0) {
      await box.deleteAt(existingIndex);
    } else {
      await box.add(
        FavoritesModel(
          id: product.id ?? '',
          title: product.title ?? '',
          image: product.images?.isNotEmpty == true
              ? product.images!.first
              : '',
          price: product.price?.toString() ?? '0',
          categoryName: product.category?.name ?? '',
        ),
      );
    }

    emit(CustomerFavoritesSuccess(favoritesLis));
  }

  /// تشيك هل المنتج في المفضلة
  bool isFavorites(String productId) {
    final box = HiveDatabase().favoritesBox!;
    return box.values.any((e) => e.id == productId);
  }

  /// جلب ليست المفضلة
  List<FavoritesModel> get favoritesLis {
    final box = HiveDatabase().favoritesBox!;
    return box.values.toList();
  }
}
