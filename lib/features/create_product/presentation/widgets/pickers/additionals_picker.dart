import 'package:flutter/material.dart';
import 'package:fudex_task/config/widgets/custom_picker_container.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

import '../../../../../helpers/enums.dart';

class AdditionalPicker extends StatelessWidget {
  final List<AdditionalEnum> selected;
  final ValueChanged<AdditionalEnum> onChanged;

  const AdditionalPicker(
      {super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomPickerContainer(
      child: DropdownButton<AdditionalEnum>(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        items: AdditionalEnum.values
            .map(
              (e) => DropdownMenuItem<AdditionalEnum>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.name.tr(context),
                    ),
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
          'additional'.tr(context),
        ),
        onChanged: (value) {
          if (value == null) return;
          onChanged(value);
        },
      ),
    );
  }
}
