import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme.dart';

class ViewImageItem extends StatelessWidget {
  final bool isMain;
  final VoidCallback? onAdd;
  final ValueChanged<File> onDelete;
  final File? image;

  const ViewImageItem({
    super.key,
    this.isMain = false,
    this.onAdd,
    this.image,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color(0XFFE1E1E1),
      strokeWidth: 2,
      radius: const Radius.circular(9),
      dashPattern: const [14, 6],
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      child: InkWell(
        onTap: onAdd,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SizedBox(
              height: isMain ? 121 : 51,
              width: isMain ? 149 : 58,
              child: onAdd != null
                  ? UnconstrainedBox(
                      child: Container(
                        height: 19,
                        width: 19,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 15,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    )
                  : image != null
                      ? ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9)),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
            ),
            if (image != null)
              Padding(
                padding: EdgeInsets.all(
                  isMain ? 10.0 : 3,
                ),
                child: InkWell(
                  onTap: () {
                    onDelete(image!);
                  },
                  child: Container(
                    height: isMain ? 19 : 12,
                    width: isMain ? 19 : 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFF3F3F3),
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      size: isMain ? 15 : 8,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
