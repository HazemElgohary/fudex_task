import 'package:flutter/material.dart';

class PickedColorItem extends StatelessWidget {
  final Color item;
  final ValueChanged<Color> onDelete;

  const PickedColorItem({super.key, required this.item, required this.onDelete});

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
        padding: const EdgeInsets.all(5),
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
            Container(
              width: 31,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                color: item,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
