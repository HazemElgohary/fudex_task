import 'package:flutter/material.dart';
import 'package:fudex_task/helpers/enums.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

import '../../../../../config/widgets/custom_picker_container.dart';

class PickProductSize extends StatelessWidget {
  final List<ProductSizes> selected;
  final ValueChanged<ProductSizes> onChanged;

  const PickProductSize(
      {super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomPickerContainer(
      child: DropdownButton<ProductSizes>(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        items: ProductSizes.values
            .map(
              (e) => DropdownMenuItem<ProductSizes>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.name),
                    if (selected.contains(e))
                      const Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                  ],
                ),
              ),
            )
            .toList(),
        hint: Text(
          'productSize'.tr(context),
        ),
        onChanged: (value) {
          if (value == null) return;
          onChanged(value);
        },
      ),
    );
  }
}
