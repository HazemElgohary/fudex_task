import 'package:flutter/material.dart';
import 'package:fudex_task/config/widgets/custom_picker_container.dart';
import 'package:fudex_task/helpers/enums.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

class SubCategoryPicker extends StatelessWidget {
  final List<SubCategory> subs;
  final SubCategory? init;
  final ValueChanged<SubCategory> onChanged;

  const SubCategoryPicker({super.key, this.init, required this.onChanged, required this.subs});

  @override
  Widget build(BuildContext context) {
    return CustomPickerContainer(
      child: DropdownButton<SubCategory>(
        value: init,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        items: subs
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ),
            )
            .toList(),
        hint: Text(
          'sub_category'.tr(context),
        ),
        onChanged: (value) {
          if (value == null) return;
          onChanged(value);
        },
      ),
    );
  }
}
