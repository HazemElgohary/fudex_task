import '../../../home/domain/entities/product_entity.dart';
import '../entities/create_product_dto.dart';

abstract class ProductRepository {
  Future<int> createProduct({
    required CreateProductDto dto,
  });

  Future<void> updateProduct({
    required int id,
    required CreateProductDto dto,
  });

  Future<int> updateAvailabilityProduct({
    required int id,
    bool? isActive,
    int? color,
    String? size,
  });

  Future<void> deleteProduct({
    required int id,
  });

  Future<List<ProductEntity>> findManyFromDb([String keyword = '']);
}
