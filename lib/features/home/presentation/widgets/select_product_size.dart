import 'package:flutter/material.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:fudex_task/helpers/enums.dart';
import 'package:fudex_task/helpers/extentions/context.dart';

class SelectProductSize extends StatelessWidget {
  final ProductEntity product;
  final ValueChanged<ProductSizes> onChanged;

  const SelectProductSize({
    super.key,
    required this.product,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 5,
      children: product.sizes
          .map(
            (e) => InkWell(
              onTap: () {
                onChanged(e);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  border: Border.all(
                    color: product.selectedSize == e ? AppColors.primary : const Color(0XFFCECECE),
                    width: 0.6,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    e.name,
                    style: context.textTheme.bodySmall!.copyWith(
                      color: product.selectedSize == e
                          ? AppColors.blackColor
                          : const Color(0XFFA9A9A9),
                      fontSize: 9.6,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
