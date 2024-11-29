import 'package:flutter/material.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

import '../../../../../config/widgets/custom_picker_container.dart';

class PickProductColor extends StatelessWidget {
  final List<Color> selected;
  final ValueChanged<Color> onChanged;

  PickProductColor(
      {super.key, required this.selected, required this.onChanged});

  final _colors = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomPickerContainer(
      child: DropdownButton<Color>(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        items: _colors
            .map(
              (e) => DropdownMenuItem<Color>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        color: e,
                      ),
                    ),
                    if (selected.contains(e))
                      Icon(
                        Icons.done,
                        color: e,
                      ),
                  ],
                ),
              ),
            )
            .toList(),
        hint: Text(
          'productColor'.tr(context),
        ),
        onChanged: (value) {
          if (value == null) return;
          onChanged(value);
        },
      ),
    );
  }
}
