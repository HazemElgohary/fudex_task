import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/config/widgets/inputs/custom_text_filed.dart';
import 'package:fudex_task/features/create_product/presentation/widgets/picked_color_item.dart';
import 'package:fudex_task/features/create_product/presentation/widgets/pickers/main_category.dart';
import 'package:fudex_task/features/create_product/presentation/widgets/pickers/pick_keywords.dart';
import 'package:fudex_task/features/create_product/presentation/widgets/product_image/images_widget.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

import '../../../../config/widgets/inputs/default_button.dart';
import '../../../../helpers/enums.dart';
import '../manager/create_product_cubit.dart';
import '../widgets/picked_keywords_item.dart';
import '../widgets/picked_sizes_item.dart';
import '../widgets/pickers/additionals_picker.dart';
import '../widgets/pickers/pick_product_color.dart';
import '../widgets/pickers/pick_product_size.dart';
import '../widgets/pickers/pick_product_type.dart';
import '../widgets/pickers/sub_category.dart';

class CreateProductScreen extends StatelessWidget {
  final ProductEntity? product;

  const CreateProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProductCubit(product: product),
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
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    ImageWidget(
                      initialImages: cubit.images,
                      onChanged: cubit.setImages,
                    ),
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
                        final cubit =
                            BlocProvider.of<CreateProductCubit>(context);
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                'main_category'.tr(context),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: SubCategoryPicker(
                                    subs: cubit
                                        .selectedMainCategory!.subcategories,
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
                    BlocBuilder<CreateProductCubit, CreateProductState>(
                      buildWhen: (previous, current) {
                        return current is CreateProductPickAdditional ||
                            current is CreateProductPickColor ||
                            current is CreateProductChangeProductType ||
                            current is CreateProductPickProductSizes;
                      },
                      builder: (context, state) {
                        final cubit =
                            BlocProvider.of<CreateProductCubit>(context);
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(
                                'additional'.tr(context),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: AdditionalPicker(
                                  selected: state is CreateProductPickAdditional
                                      ? state.selected
                                      : cubit.selectedAdditional,
                                  onChanged: cubit.onAdditionalChange,
                                ),
                              ),
                            ),
                            if (cubit.selectedAdditional
                                .contains(AdditionalEnum.productColor)) ...[
                              ListTile(
                                title: Text(
                                  'productColor'.tr(context),
                                ),
                                subtitle: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: PickProductColor(
                                    selected: cubit.selectedColors,
                                    onChanged: cubit.onColorsChange,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Wrap(
                                  runSpacing: 10,
                                  children: cubit.selectedColors
                                      .map(
                                        (e) => PickedColorItem(
                                          item: e,
                                          onDelete: cubit.onColorsChange,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                            if (cubit.selectedAdditional
                                .contains(AdditionalEnum.productSize)) ...[
                              ListTile(
                                title: Text(
                                  'productSize'.tr(context),
                                ),
                                subtitle: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: PickProductSize(
                                    selected: cubit.selectedProductSizes,
                                    onChanged: cubit.onProductSizesChange,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Wrap(
                                  runSpacing: 10,
                                  children: cubit.selectedProductSizes
                                      .map(
                                        (e) => PickedSizesItem(
                                          item: e,
                                          onDelete: cubit.onProductSizesChange,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                            if (cubit.selectedAdditional
                                .contains(AdditionalEnum.productType)) ...[
                              ListTile(
                                title: Text(
                                  'productType'.tr(context),
                                ),
                                subtitle: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: PickProductType(
                                    selected: cubit.selectedType,
                                    onChanged: cubit.changeProductType,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                    BlocBuilder<CreateProductCubit, CreateProductState>(
                      buildWhen: (previous, current) =>
                          current is CreateProductPickKeywords,
                      builder: (context, state) {
                        final cubit =
                            BlocProvider.of<CreateProductCubit>(context);
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                'keywords'.tr(context),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: PickKeywords(
                                  onChanged: cubit.pickKeywords,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Wrap(
                                runSpacing: 10,
                                children: cubit.keywords
                                    .map(
                                      (e) => PickedKeywordsItem(
                                        item: e,
                                        onDelete: cubit.pickKeywords,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    ListTile(
                      title: Text(
                        'product_des'.tr(context),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFiled(
                          controller: cubit.productDesController,
                          hint: 'product_des'.tr(context),
                          maxLiens: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 84,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                offset: const Offset(0, 0),
                color: AppColors.blackColor.withOpacity(.25),
              ),
            ],
          ),
          child: BlocConsumer<CreateProductCubit, CreateProductState>(
            buildWhen: (previous, current) {
              return current is CreateProductLoading ||
                  current is CreateProductSuccess ||
                  current is CreateProductError;
            },
            listener: (context, state) {
              if (state is CreateProductSuccess) {
                Navigator.pop(context, true);
              }
              if (state is CreateProductError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.error,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<CreateProductCubit>(context);
              return DefaultButton(
                text: 'save'.tr(context),
                onTap:
                    product != null ? cubit.updateProduct : cubit.createProduct,
                loading: state is CreateProductLoading,
              );
            },
          ),
        ),
      ),
    );
  }
}
