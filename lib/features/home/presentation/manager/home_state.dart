part of 'home_cubit.dart';

sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeGetProductLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeGetProductSuccess extends HomeState {
  final List<ProductEntity> products;

  HomeGetProductSuccess({required this.products});

  @override
  List<Object?> get props => [
        products,
      ];
}

final class HomeGetProductError extends HomeState {
  final String error;

  HomeGetProductError({required this.error});

  @override
  List<Object?> get props => [
        error,
      ];
}

final class HomeDeleteProductLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeDeleteProductSuccess extends HomeState {
  final List<ProductEntity> products;

  HomeDeleteProductSuccess({required this.products});

  @override
  List<Object?> get props => [
        products,
      ];
}

final class HomeDeleteProductError extends HomeState {
  final String error;

  HomeDeleteProductError({required this.error});

  @override
  List<Object?> get props => [
        error,
      ];
}

final class HomePickCategory extends HomeState {
  final ProductCategory category;

  HomePickCategory({required this.category});

  @override
  List<Object?> get props => [
        category,
      ];
}
