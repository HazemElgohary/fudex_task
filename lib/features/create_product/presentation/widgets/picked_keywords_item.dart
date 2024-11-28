import 'package:flutter/material.dart';

class PickedKeywordsItem extends StatelessWidget {
  final String item;
  final ValueChanged<String> onDelete;

  const PickedKeywordsItem({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: 10,
      ),
      child: Container(
        height: 38,
        width: 100,
        decoration: BoxDecoration(
          color: const Color(0XFF28A6FD).withOpacity(0.16),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
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
            Text(item),
          ],
        ),
      ),
    );
  }
}
