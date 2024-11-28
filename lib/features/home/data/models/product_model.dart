import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:fudex_task/helpers/enums.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.images,
    required super.name,
    required super.mainCategory,
    required super.subCategory,
    required super.price,
    required super.colors,
    required super.sizes,
    super.type,
    required super.keywords,
    required super.description,
    required super.isActive,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      images: List<String>.from(jsonDecode(json['images'])),
      name: json['name'],
      isActive: json['isActive'] == 1,
      mainCategory: ProductCategory.values.firstWhere((e) => e.name == json['mainCategory']),
      subCategory: SubCategory.values.firstWhere((e) => e.name == json['subCategory']),
      price: json['price'],
      colors: (jsonDecode(json['colors']) as List)
          .map(
            (e) => Color(e),
          )
          .toList(),
      sizes: (jsonDecode(json['sizes']) as List<dynamic>)
          .map((size) => ProductSizes.values.firstWhere((e) => e.name == size))
          .toList(),
      type: json['type'] == null
          ? null
          : ProductType.values.firstWhere((e) => e.name == json['type']),
      keywords: List<String>.from(jsonDecode(json['keywords'])),
      description: json['description'],
    );
  }
}
