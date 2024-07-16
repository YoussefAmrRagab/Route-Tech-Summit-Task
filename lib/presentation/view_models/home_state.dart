part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductLoaded extends HomeState {
  final List<Product> products;

  ProductLoaded(this.products);
}

final class ProductsFiltered extends HomeState {
  final List<Product> filteredProducts;

  ProductsFiltered(this.filteredProducts);
}

class Error extends HomeState {
  final String errorMessage;

  Error(this.errorMessage);
}
