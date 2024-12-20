import 'package:get_it/get_it.dart';

import '../../../../helpers/enums.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../data/repositories/product_repository_imp.dart';
import '../entities/create_product_dto.dart';

class ProductUseCases {
  final repo = GetIt.instance.registerSingleton(ProductRepositoryImp());

  Future<int> createProduct({required CreateProductDto dto}) {
    return repo.createProduct(dto: dto);
  }

  Future<List<ProductEntity>> findManyFromDb({
    String? text,
    ProductCategory? category,
  }) {
    return repo.findManyFromDb(
      text: text,
      category: category,
    );
  }

  Future<void> updateProduct({required int id, required CreateProductDto dto}) {
    return repo.updateProduct(id: id, dto: dto);
  }

  Future<void> deleteProduct({
    required int id,
  }) {
    return repo.deleteProduct(id: id);
  }

  Future<int> updateAvailabilityProduct({
    required int id,
    bool? isActive,
    int? color,
    String? size,
  }) {
    return repo.updateAvailabilityProduct(
      id: id,
      isActive: isActive,
      size: size,
      color: color,
    );
  }
}
