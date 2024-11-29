import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';
import 'package:image_picker/image_picker.dart';

import 'image_item.dart';

class ImageWidget extends StatefulWidget {
  final List<File> initialImages;
  final ValueChanged<List<File>> onChanged;

  const ImageWidget(
      {super.key, required this.onChanged, required this.initialImages});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final images = <File>[];

  @override
  void initState() {
    images.addAll(widget.initialImages);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'product_images'.tr(context),
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        DottedBorder(
          color: const Color(0XFFE1E1E1),
          strokeWidth: 2,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          radius: const Radius.circular(9),
          dashPattern: const [14, 6],
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          child: SizedBox(
            // height: 253,
            width: double.infinity,
            child: Column(
              children: [
                ViewImageItem(
                  isMain: true,
                  image: images.isNotEmpty ? images.first : null,
                  onAdd: images.isEmpty ? pickImage : null,
                  onDelete: deleteImage,
                ),
                const SizedBox(
                  height: 15,
                ),
                if (images.isNotEmpty)
                  Wrap(
                    children: List.generate(
                      (images.length + 1),
                      (index) => index == 0
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 10,
                                bottom: 10,
                              ),
                              child: ViewImageItem(
                                image: index < images.length
                                    ? images[index]
                                    : null,
                                onAdd:
                                    index == (images.length) ? pickImage : null,
                                onDelete: deleteImage,
                              ),
                            ),
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'image_size_limit'.tr(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        images.add(File(image.path));
        widget.onChanged(images);
        setState(() {});
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
    }
  }

  void deleteImage(File image) {
    images.remove(image);
    widget.onChanged(images);
    setState(() {});
  }
}
