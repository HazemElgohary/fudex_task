import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/enums.dart';

part 'create_product_state.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit() : super(CreateProductInitial());

  final productName = TextEditingController();
  final price = TextEditingController();

  ProductCategory? selectedMainCategory;
  SubCategory? selectedSubCategory;
  final selectedAdditional = <AdditionalEnum>[];

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
}
