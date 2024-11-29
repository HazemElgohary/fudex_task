import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_task/features/create_product/domain/entities/create_product_dto.dart';
import 'package:fudex_task/features/create_product/domain/use_cases/product_use_cases.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../helpers/enums.dart';

part 'create_product_state.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  final ProductEntity? product;

  CreateProductCubit({this.product}) : super(CreateProductInitial()) {
    if (product != null) {
      setInitialData();
    }
  }

  final useCase = GetIt.instance.get<ProductUseCases>();

  void setInitialData() {
    images.clear();
    for (final image in product!.images) {
      images.add(File(image.path));
    }
    productName.text = product!.name;
    price.text = product!.price;
    productDesController.text = product!.description;
    selectedMainCategory = product!.mainCategory;
    selectedSubCategory = product!.subCategory;
    selectedAdditional.addAll(
      [
        if (product!.colors.isNotEmpty) AdditionalEnum.productColor,
        if (product!.sizes.isNotEmpty) AdditionalEnum.productSize,
        if (product!.type != null) AdditionalEnum.productType,
      ],
    );
    selectedColors.addAll(product!.colors);
    selectedProductSizes.addAll(product!.sizes);
    selectedType = product!.type;
    keywords.addAll(product!.keywords);
  }

  final images = <File>[];

  void setImages(List<File> list) {
    images.clear();
    images.addAll(list);
  }

  final productName = TextEditingController();
  final price = TextEditingController();
  final productDesController = TextEditingController();

  ProductCategory? selectedMainCategory;
  SubCategory? selectedSubCategory;
  final selectedAdditional = <AdditionalEnum>[];
  final selectedColors = <Color>[];
  final keywords = <String>[];
  final selectedProductSizes = <ProductSizes>[];
  ProductType? selectedType;

  void changeProductType(ProductType selected) {
    if (selectedType != selected) {
      selectedType = selected;
      emit(CreateProductChangeProductType(selected: selectedType!));
    }
  }

  void changeMainCategory(ProductCategory selected) {
    if (selectedMainCategory != selected) {
      selectedSubCategory = null;
      selectedMainCategory = selected;
      emit(CreateProductChangeMainCate(selected: selectedMainCategory!));
    }
  }

  void changeSubCategory(SubCategory selected) {
    if (selectedSubCategory != selected) {
      selectedSubCategory = selected;
      emit(CreateProductChangeSubCate(selected: selectedSubCategory!));
    }
  }

  void onAdditionalChange(AdditionalEnum selected) {
    if (selectedAdditional.contains(selected)) {
      selectedAdditional.remove(selected);
    } else {
      selectedAdditional.add(selected);
    }
    emit(
      CreateProductPickAdditional(
        selected: List.generate(
          selectedAdditional.length,
          (index) => selectedAdditional[index],
        ),
      ),
    );
  }

  void onColorsChange(Color selected) {
    if (selectedColors.contains(selected)) {
      selectedColors.remove(selected);
    } else {
      selectedColors.add(selected);
    }
    emit(
      CreateProductPickColor(
        selected: List.generate(
          selectedColors.length,
          (index) => selectedColors[index],
        ),
      ),
    );
  }

  void onProductSizesChange(ProductSizes selected) {
    if (selectedProductSizes.contains(selected)) {
      selectedProductSizes.remove(selected);
    } else {
      selectedProductSizes.add(selected);
    }
    emit(
      CreateProductPickProductSizes(
        selected: List.generate(
          selectedProductSizes.length,
          (index) => selectedProductSizes[index],
        ),
      ),
    );
  }

  void pickKeywords(String selected) {
    if (keywords.contains(selected)) {
      keywords.remove(selected);
    } else {
      keywords.add(selected);
    }
    emit(
      CreateProductPickKeywords(
        selected: List.generate(
          keywords.length,
          (index) => keywords[index],
        ),
      ),
    );
  }

  /// Create product
  Future<void> createProduct() async {
    try {
      validate();
      emit(CreateProductLoading());
      await useCase.createProduct(
        dto: CreateProductDto(
          images: images,
          name: productName.text,
          mainCategory: selectedMainCategory!,
          subCategory: selectedSubCategory!,
          price: price.text,
          colors: selectedColors,
          sizes: selectedProductSizes,
          type: selectedType,
          keywords: keywords,
          isActive: true,
          description: productDesController.text,
        ),
      );

      emit(CreateProductSuccess());
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(CreateProductError(error: e.toString()));
    }
  }

  Future<void> updateProduct() async {
    try {
      validate();
      emit(CreateProductLoading());
      await useCase.updateProduct(
        id: product!.id,
        dto: CreateProductDto(
          images: images,
          name: productName.text,
          mainCategory: selectedMainCategory!,
          subCategory: selectedSubCategory!,
          price: price.text,
          colors: selectedColors,
          sizes: selectedProductSizes,
          type: selectedType,
          keywords: keywords,
          isActive: true,
          description: productDesController.text,
        ),
      );

      emit(CreateProductSuccess());
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(CreateProductError(error: e.toString()));
    }
  }

  void validate() {
    if (images.length < 3) throw 'يجب ان لا يقل عدد الصور عن ٣ صور';
    if (productName.text.isEmpty) throw 'يجب ادخال اسم للمنتج';
    if (selectedMainCategory == null) throw 'يجب اختيار القسم الرئيسي';
    if (selectedSubCategory == null) throw 'يجب اختيار القسم الفرعي';
    if (price.text.isEmpty) throw 'يجب ادخال سعر للمنتج';
  }
}
