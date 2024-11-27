import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/enums.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

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
}
