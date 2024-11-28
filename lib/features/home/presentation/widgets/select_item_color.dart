import 'package:flutter/material.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';

class SelectItemColor extends StatelessWidget {
  final ProductEntity product;
  final Color? selected;
  final ValueChanged<Color> onChanged;

  const SelectItemColor({
    super.key,
    required this.product,
    required this.onChanged,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 5,
      children: product.colors
          .map(
            (e) => InkWell(
              onTap: () {
                onChanged(e);
              },
              child: Container(
                height: 16,
                width: 14,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  color: e,
                  border: selected == e
                      ? Border.all(
                          color: AppColors.primary,
                          width: 1.4,
                        )
                      : null,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
