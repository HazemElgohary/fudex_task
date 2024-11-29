import 'dart:io';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:fudex_task/helpers/enums.dart';

class ProductEntity extends Equatable {
  static const String tableName = 'product';
  final int id;
  final List<String> images; // base64
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
    type TEXT NOT NULL,
    description TEXT NOT NULL,
    images TEXT NOT NULL,      
    colors TEXT NOT NULL,      
    selectedColor INTEGER,      
    selectedSize TEXT,      
    sizes TEXT NOT NULL,       
    isActive INTEGER NOT NULL,       
    keywords TEXT NOT NULL     
)
  ''';

  ProductEntity copyWith({
    int? id,
    List<String>? images, // base6,
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
