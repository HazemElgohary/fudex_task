import 'package:fudex_task/features/create_product/data/data_sources/product_offline_data_base.dart';
import 'package:fudex_task/features/create_product/domain/entities/create_product_dto.dart';

import 'package:fudex_task/features/home/domain/entities/product_entity.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImp extends ProductRepository {
  final dataSource = GetIt.instance.registerSingleton(ProductOfflineDataSource());

  @override
  Future<int> createProduct({required CreateProductDto dto}) {
    return dataSource.createProduct(dto: dto);
  }

  @override
  Future<List<ProductEntity>> findManyFromDb([String keyword = '']) {
    return dataSource.findManyFromDb();
  }

  @override
  Future<void> updateProduct({required int id, required CreateProductDto dto}) {
    return dataSource.updateProduct(id: id, dto: dto);
  }

  @override
  Future<void> deleteProduct({required int id}) {
    return dataSource.deleteOneById(id);
  }

  @override
  Future<int> updateAvailabilityProduct({
    required int id,
    bool? isActive,
    int? color,
    String? size,
  }) {
    return dataSource.updateAvailabilityProduct(
      id: id,
      isActive: isActive,
      size: size,
      color: color,
    );
  }
}
