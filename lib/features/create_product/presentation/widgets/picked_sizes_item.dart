import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';

class PickedSizesItem extends StatelessWidget {
  final ProductSizes item;
  final ValueChanged<ProductSizes> onDelete;

  const PickedSizesItem({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: 10,
      ),
      child: Container(
        height: 38,
        width: 67,
        decoration: BoxDecoration(
          color: const Color(0XFF28A6FD).withOpacity(0.16),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                onDelete(item);
              },
              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
            Text(item.name),
          ],
        ),
      ),
    );
  }
}
