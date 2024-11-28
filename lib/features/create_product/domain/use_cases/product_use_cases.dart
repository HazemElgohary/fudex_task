import 'package:get_it/get_it.dart';

import '../../../home/domain/entities/product_entity.dart';
import '../../data/repositories/product_repository_imp.dart';
import '../entities/create_product_dto.dart';

class ProductUseCases {
  final repo = GetIt.instance.registerSingleton(ProductRepositoryImp());

  Future<int> createProduct({required CreateProductDto dto}) {
    return repo.createProduct(dto: dto);
  }

  Future<List<ProductEntity>> findManyFromDb([String keyword = '']) {
    return repo.findManyFromDb();
  }

  Future<int> updateProduct({required int id, required CreateProductDto dto}) {
    return repo.updateProduct(id: id, dto: dto);
  }
}
