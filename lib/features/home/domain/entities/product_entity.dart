import 'dart:io';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:fudex_task/helpers/enums.dart';

class ProductEntity extends Equatable {
  static const String tableName = 'product';
  final int id;
  final List<ProductImageEntity> images; // base64
  final String name;
  final ProductCategory mainCategory;
  final SubCategory subCategory;
  final String price;
  final List<Color> colors;
  final Color? selectedColor;
  final List<ProductSizes> sizes;
  final ProductSizes? selectedSize;
  final ProductType? type;
  final List<String> keywords;
  final String description;
  final bool isActive;

  const ProductEntity({
    required this.id,
    required this.images,
    required this.name,
    required this.mainCategory,
    required this.subCategory,
    required this.price,
    required this.colors,
    required this.sizes,
    this.selectedColor,
    this.selectedSize,
    this.type,
    required this.keywords,
    required this.description,
    required this.isActive,
  });

  static const createStatement = '''
  CREATE TABLE $tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    mainCategory TEXT NOT NULL,
    subCategory TEXT NOT NULL,
    price TEXT NOT NULL,
    type TEXT,
    description TEXT NOT NULL,
    images TEXT NOT NULL,      
    colors TEXT,      
    selectedColor INTEGER,      
    selectedSize TEXT,      
    sizes TEXT,       
    isActive INTEGER NOT NULL,       
    keywords TEXT     
)
  ''';

  ProductEntity copyWith({
    int? id,
    List<ProductImageEntity>? images, // base6,
    String? name,
    ProductCategory? mainCategory,
    SubCategory? subCategory,
    String? price,
    List<Color>? colors,
    Color? selectedColor,
    List<ProductSizes>? sizes,
    ProductSizes? selectedSize,
    ProductType? type,
    List<String>? keywords,
    String? description,
    bool? isActive,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      mainCategory: mainCategory ?? this.mainCategory,
      subCategory: subCategory ?? this.subCategory,
      price: price ?? this.price,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      type: type ?? this.type,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
      keywords: keywords ?? this.keywords,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
        id,
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

class ProductImageEntity extends Equatable {
  final String path;
  final String base64Image;

  const ProductImageEntity({
    required this.path,
    required this.base64Image,
  });

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'base64Image': base64Image,
    };
  }

  // Future<List<String>> convertFilesToBase64(List<File> imageFiles) async {
  //   List<String> base64Images = [];
  //
  //   for (File imageFile in imageFiles) {
  //     final imageBytes = await imageFile.readAsBytes();
  //     base64Images.add(base64Encode(imageBytes));
  //   }
  //
  //   return base64Images;
  // }

  @override
  List<Object?> get props => [
        path,
        base64Image,
      ];
}
