part of 'create_product_cubit.dart';

sealed class CreateProductState extends Equatable {}

final class CreateProductInitial extends CreateProductState {
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
