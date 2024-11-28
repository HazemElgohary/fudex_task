import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../helpers/enums.dart';
import '../../../create_product/domain/use_cases/product_use_cases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getProducts();
  }

  final useCase = GetIt.instance.registerSingleton(ProductUseCases());

  final searchController = TextEditingController();

  Timer? _debounce;

  void searchInList(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {},
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
  Future<void> getProducts() async {
    try {
      emit(HomeGetProductLoading());
      products.clear();
      products.addAll(
        await useCase.findManyFromDb(),
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
}
