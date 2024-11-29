import 'package:flutter/material.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

import '../../../helpers/enums.dart';

class PickMainCategory extends StatelessWidget {
  final ProductCategory? init;
  final ValueChanged<ProductCategory> onChanged;

  const PickMainCategory({
    super.key,
    this.init,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: const Color(0XFFEFEFEF),
        ),
      ),
      child: DropdownButton<ProductCategory>(
        value: init,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        items: ProductCategory.values
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ),
            )
            .toList(),
        hint: Text(
          'pick_category'.tr(context),
        ),
        onChanged: (value) {
          if (value == null) return;
          onChanged(value);
        },
      ),
    );
  }
}
