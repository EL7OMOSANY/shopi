part of 'customer_favorites_cubit.dart';

sealed class CustomerFavoritesState {}

final class CustomerFavoritesInitial extends CustomerFavoritesState {}

final class CustomerFavoritesLoading extends CustomerFavoritesState {}

final class CustomerFavoritesSuccess extends CustomerFavoritesState {
  final List<FavoritesModel> favoritesList;
  CustomerFavoritesSuccess(this.favoritesList);
}

final class CustomerFavoritesFailure extends CustomerFavoritesState {
  final String errorMessage;
  CustomerFavoritesFailure(this.errorMessage);
}
