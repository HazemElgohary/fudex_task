import 'package:flutter/material.dart';
import 'package:fudex_task/config/widgets/custom_picker_container.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

class PickKeywords extends StatelessWidget {
  final ValueChanged<String> onChanged;

  PickKeywords({super.key, required this.onChanged});

  List<String> keywords = [
    "حقيبة",
    "شنطة",
    "خوص",
    "هاند ميد",
    "جديد",
    "جودة",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomPickerContainer(
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        items: keywords
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                ),
              ),
            )
            .toList(),
        hint: Text(
          'keywords'.tr(context),
        ),
        onChanged: (value) {
          if (value == null) return;
          onChanged(value);
        },
      ),
    );
  }
}
