import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_task/features/create_product/domain/entities/create_product_dto.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../helpers/enums.dart';
import '../../../create_product/domain/use_cases/product_use_cases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getProducts();
  }

  final useCase = GetIt.instance.get<ProductUseCases>();

  final searchController = TextEditingController();

  Timer? _debounce;

  String? searchText;
  void searchInList(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        searchText = text;
        getProducts(
          text: text,
          category: selectedCategory,
        );
      },
    );
  }

  ProductCategory? selectedCategory;

  void changeCategory(ProductCategory category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      emit(
        HomePickCategory(category: category),
      );
    }
  }

  final products = <ProductEntity>[];

  /// get product
  Future<void> getProducts({
    String? text,
    ProductCategory? category,
  }) async {
    try {
      emit(HomeGetProductLoading());
      products.clear();
      products.addAll(
        await useCase.findManyFromDb(
          text: text,
          category: category,
        ),
      );

      emit(
        HomeGetProductSuccess(
          products: products,
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(HomeGetProductError(error: e.toString()));
    }
  }

  Future<void> deleteProduct({required int id}) async {
    try {
      emit(HomeDeleteProductLoading());
      await useCase.deleteProduct(id: id);
      products.removeWhere(
        (element) => element.id == id,
      );

      emit(
        HomeDeleteProductSuccess(
          products: List.generate(
            products.length,
            (index) => products[index],
          ),
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(HomeDeleteProductError(error: e.toString()));
    }
  }

  Future<void> updateProduct({
    required ProductEntity product,
    bool? isActive,
    Color? color,
    ProductSizes? size,
  }) async {
    try {
      emit(HomeUpdateProductLoading());
      await useCase.updateAvailabilityProduct(
        id: product.id,
        isActive: isActive,
        color: color?.value,
        size: size?.name,
      );
      updateProductLocal(
        product: product,
        isActive: isActive,
        color: color,
        size: size,
      );

      emit(
        HomeUpdateProductSuccess(
          products: List.generate(
            products.length,
            (index) => products[index],
          ),
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(HomeUpdateProductError(error: e.toString()));
    }
  }

  void updateProductLocal({
    required ProductEntity product,
    bool? isActive,
    Color? color,
    ProductSizes? size,
  }) {
    final oldIndex = products.indexWhere(
      (element) => element.id == product.id,
    );
    if (oldIndex != -1) {
      final newProduct = products[oldIndex].copyWith(
        isActive: isActive,
        selectedColor: color,
        selectedSize: size,
      );
      products[oldIndex] = newProduct;
    }
  }
}
