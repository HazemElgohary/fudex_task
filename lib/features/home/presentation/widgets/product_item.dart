import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:fudex_task/features/home/presentation/widgets/select_item_color.dart';
import 'package:fudex_task/features/home/presentation/widgets/select_product_size.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';
import 'package:skeletons/skeletons.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  final ValueChanged<ProductEntity> onDelete;
  final ValueChanged<ProductEntity> onActivation;

  const ProductItem({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onActivation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  value: true,
                  activeColor: AppColors.primary,
                  onChanged: (value) {},
                ),
                IconButton(
                  onPressed: () {},
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
              children: [
                Expanded(
                  child: Image.memory(
                    base64Decode(
                      product.images.first,
                    ),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => SkeletonItem(
                      child: Container(
                        height: 90,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        height: 10,
                      ),
                      SelectProductSize(
                        product: product,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SelectItemColor(
                        product: product,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
