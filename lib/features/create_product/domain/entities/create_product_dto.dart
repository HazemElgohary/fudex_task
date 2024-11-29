import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';

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
    final convertedImages = await convertFilesImageEntity(images);
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
      'images': jsonEncode(convertedImages
          .map(
            (e) => e.toMap(),
          )
          .toList()),
      'colors': jsonEncode(convertedColors),
      'sizes': jsonEncode(convertedSizes),
      'keywords': jsonEncode(keywords),
    };
  }

  Future<List<ProductImageEntity>> convertFilesImageEntity(
      List<File> imageFiles) async {
    List<ProductImageEntity> imagesEntity = [];

    for (File imageFile in imageFiles) {
      final imageBytes = await imageFile.readAsBytes();
      imagesEntity.add(
        ProductImageEntity(
          path: imageFile.path,
          base64Image: base64Encode(imageBytes),
        ),
      );
    }

    return imagesEntity;
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
