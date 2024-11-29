import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../../../helpers/enums.dart';

class CreateProductDto extends Equatable {
  final List<File> images;
  final String name;
  final ProductCategory mainCategory;
  final SubCategory subCategory;
  final String price;
  final List<Color> colors;
  final List<ProductSizes> sizes;
  final ProductType? type;
  final List<String> keywords;
  final String description;
  final bool isActive;

  const CreateProductDto({
    required this.images,
    required this.name,
    required this.mainCategory,
    required this.subCategory,
    required this.price,
    required this.colors,
    required this.sizes,
    this.type,
    required this.keywords,
    required this.description,
    required this.isActive,
  });

  /// Convert this object to json data.
  Future<Map<String, dynamic>> toMap() async {
    final convertedImages = await convertFilesToBase64(images);
    final convertedColors = colors
        .map(
          (e) => e.value,
        )
        .toList();
    final convertedSizes = sizes
        .map(
          (e) => e.name,
        )
        .toList();
    return <String, dynamic>{
      'name': name,
      'mainCategory': mainCategory.name,
      'subCategory': subCategory.name,
      'price': price,
      if (convertedColors.isNotEmpty) 'selectedColor': convertedColors.first,
      if (convertedSizes.isNotEmpty) 'selectedSize': convertedSizes.first,
      'isActive': isActive ? 1 : 0,
      if (type != null) 'type': type!.name,
      'description': description,
      'images': jsonEncode(convertedImages),
      'colors': jsonEncode(convertedColors),
      'sizes': jsonEncode(convertedSizes),
      'keywords': jsonEncode(keywords),
    };
  }

  Future<List<String>> convertFilesToBase64(List<File> imageFiles) async {
    List<String> base64Images = [];

    for (File imageFile in imageFiles) {
      final imageBytes = await imageFile.readAsBytes();
      base64Images.add(base64Encode(imageBytes));
    }

    return base64Images;
  }

  @override
  List<Object?> get props => [
        images,
        name,
        mainCategory,
        subCategory,
        price,
        colors,
        sizes,
        type,
        keywords,
        description,
      ];
}
