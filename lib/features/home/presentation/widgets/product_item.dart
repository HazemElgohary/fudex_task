import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:fudex_task/features/home/presentation/widgets/select_item_color.dart';
import 'package:fudex_task/features/home/presentation/widgets/select_product_size.dart';
import 'package:fudex_task/helpers/enums.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';
import 'package:skeletons/skeletons.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  final ValueChanged<ProductEntity> onTap;
  final ValueChanged<ProductEntity> onDelete;
  final ValueChanged<bool> onActivation;
  final ValueChanged<Color> onColorSelected;
  final ValueChanged<ProductSizes> onSizeSelected;

  const ProductItem({
    super.key,
    required this.product,
    required this.onTap,
    required this.onDelete,
    required this.onActivation,
    required this.onColorSelected,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF717171).withOpacity(0.15),
              offset: const Offset(-2, 2),
              blurRadius: 10,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'product_activation'.tr(context),
                    ),
                  ),
                  Switch.adaptive(
                    value: product.isActive,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      onActivation(value);
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      onDelete(product);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0XFFDBDBDB),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.memory(
                      base64Decode(
                        product.images.first.base64Image,
                      ),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          SkeletonItem(
                        child: Container(
                          height: 90,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                        ),
                        Text(
                          '${product.price} ${'SAR'.tr(context)}',
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SelectProductSize(
                          product: product,
                          onChanged: onSizeSelected,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SelectItemColor(
                          product: product,
                          onChanged: onColorSelected,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
