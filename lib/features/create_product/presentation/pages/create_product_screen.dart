import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_task/config/widgets/inputs/custom_text_filed.dart';
import 'package:fudex_task/features/create_product/presentation/widgets/pickers/main_category.dart';
import 'package:fudex_task/features/create_product/presentation/widgets/product_image/images_widget.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

import '../manager/create_product_cubit.dart';
import '../widgets/pickers/additionals_picker.dart';
import '../widgets/pickers/sub_category.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProductCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'create_product'.tr(context),
            style: context.textTheme.bodyLarge,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.arrow_forward,
                size: 30,
              ),
            ),
          ),
        ),
        body: BlocBuilder<CreateProductCubit, CreateProductState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            final cubit = BlocProvider.of<CreateProductCubit>(context);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ImageWidget(),
                    ListTile(
                      title: Text(
                        'product_name'.tr(context),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFiled(
                          controller: cubit.productName,
                          hint: 'product_name'.tr(context),
                        ),
                      ),
                    ),
                    BlocBuilder<CreateProductCubit, CreateProductState>(
                      buildWhen: (previous, current) =>
                          current is CreateProductChangeMainCate ||
                          current is CreateProductChangeSubCate,
                      builder: (context, state) {
                        final cubit = BlocProvider.of<CreateProductCubit>(context);
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                'main_category'.tr(context),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: MainCategoryPicker(
                                  onChanged: cubit.changeMainCategory,
                                  init: cubit.selectedMainCategory,
                                ),
                              ),
                            ),
                            if (cubit.selectedMainCategory != null)
                              ListTile(
                                title: Text(
                                  'sub_category'.tr(context),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: SubCategoryPicker(
                                    subs: cubit.selectedMainCategory!.subcategories,
                                    onChanged: cubit.changeSubCategory,
                                    init: cubit.selectedSubCategory,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    ListTile(
                      title: Text(
                        'product_price'.tr(context),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFiled(
                          controller: cubit.price,
                          hint: 'product_price'.tr(context),
                          isNumber: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'additional'.tr(context),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: BlocBuilder<CreateProductCubit, CreateProductState>(
                          buildWhen: (previous, current) => current is CreateProductPickAdditional,
                          builder: (context, state) {
                            final cubit = BlocProvider.of<CreateProductCubit>(context);
                            return AdditionalPicker(
                              selected: state is CreateProductPickAdditional
                                  ? state.selected
                                  : cubit.selectedAdditional,
                              onChanged: cubit.onAdditionalChange,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
