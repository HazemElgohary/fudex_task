part of 'create_product_cubit.dart';

sealed class CreateProductState extends Equatable {}

final class CreateProductInitial extends CreateProductState {
  @override
  List<Object?> get props => [];
}

final class CreateProductLoading extends CreateProductState {
  @override
  List<Object?> get props => [];
}

final class CreateProductSuccess extends CreateProductState {
  @override
  List<Object?> get props => [];
}

final class CreateProductError extends CreateProductState {
  final String error;

  CreateProductError({required this.error});
  @override
  List<Object?> get props => [];
}

final class CreateProductChangeMainCate extends CreateProductState {
  final ProductCategory selected;

  CreateProductChangeMainCate({required this.selected});

  @override
  List<Object?> get props => [
        selected,
      ];
}

final class CreateProductPickKeywords extends CreateProductState {
  final List<String> selected;

  CreateProductPickKeywords({required this.selected});

  @override
  List<Object?> get props => [
        selected,
      ];
}

final class CreateProductChangeProductType extends CreateProductState {
  final ProductType selected;

  CreateProductChangeProductType({required this.selected});

  @override
  List<Object?> get props => [
        selected,
      ];
}

final class CreateProductChangeSubCate extends CreateProductState {
  final SubCategory selected;

  CreateProductChangeSubCate({required this.selected});

  @override
  List<Object?> get props => [
        selected,
      ];
}

final class CreateProductPickAdditional extends CreateProductState {
  final List<AdditionalEnum> selected;

  CreateProductPickAdditional({required this.selected});

  @override
  List<Object?> get props => [selected];
}

final class CreateProductPickColor extends CreateProductState {
  final List<Color> selected;

  CreateProductPickColor({required this.selected});

  @override
  List<Object?> get props => [selected];
}

final class CreateProductPickProductSizes extends CreateProductState {
  final List<ProductSizes> selected;

  CreateProductPickProductSizes({required this.selected});

  @override
  List<Object?> get props => [selected];
}
