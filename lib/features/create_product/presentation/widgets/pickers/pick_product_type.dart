import 'package:flutter/material.dart';
import 'package:fudex_task/config/widgets/inputs/custom_text_filed.dart';
import 'package:fudex_task/helpers/enums.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

import '../../../../../config/widgets/custom_picker_container.dart';

class PickProductType extends StatelessWidget {
  final ProductType? selected;
  final ValueChanged<ProductType> onChanged;

  const PickProductType({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: ProductType.values
          .map(
            (e) => InkWell(
              onTap: () {
                onChanged(e);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    groupValue: selected,
                    value: e,
                    onChanged: (value) {
                      if (value == null) return;
                      onChanged(e);
                    },
                  ),
                  Text(
                    e.name.tr(context),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
