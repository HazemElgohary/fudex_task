import 'package:fudex_task/features/create_product/domain/entities/create_product_dto.dart';
import 'package:fudex_task/features/home/data/models/product_model.dart';
import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../service/offline/database/database_service.dart';

class ProductOfflineDataSource extends BaseTableService<ProductEntity> {
  ProductOfflineDataSource() : super(ProductEntity.tableName);

  /// Create a new [Product] and insert data to local database.
  Future<int> createProduct({
    required CreateProductDto dto,
  }) async {
    return db.insert(
      name,
      await dto.toMap(),
    );
  }

  /// Update [Product] data by id.
  Future<int> updateProduct({
    required int id,
    required CreateProductDto dto,
  }) async {
    return db.update(
      name,
      await dto.toMap(),
      where: 'id="$id"',
    );
  }

  /// Get all [Product]s data from local database.
  @override
  Future<List<ProductEntity>> findManyFromDb([String keyword = '']) async {
    return (await db.query(name) as List).map((e) => ProductModel.fromJson(e)).toList();
  }
}
