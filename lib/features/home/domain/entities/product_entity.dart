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
  final List<ProductSizes> sizes;
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
    required this.type,
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
    sizes TEXT NOT NULL,       
    isActive INTEGER NOT NULL,       
    keywords TEXT NOT NULL     
)
  ''';

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
