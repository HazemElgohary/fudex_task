import '../../../home/domain/entities/product_entity.dart';
import '../entities/create_product_dto.dart';

abstract class ProductRepository {
  Future<int> createProduct({
    required CreateProductDto dto,
  });

  Future<int> updateProduct({
    required int id,
    required CreateProductDto dto,
  });

  Future<List<ProductEntity>> findManyFromDb([String keyword = '']);
}