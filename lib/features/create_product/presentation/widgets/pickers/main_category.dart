import 'package:flutter/material.dart';
import 'package:fudex_task/config/widgets/custom_picker_container.dart';
import 'package:fudex_task/helpers/enums.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

class MainCategoryPicker extends StatelessWidget {
  final ProductCategory? init;
  final ValueChanged<ProductCategory> onChanged;
  const MainCategoryPicker({super.key, this.init, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomPickerContainer(
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
