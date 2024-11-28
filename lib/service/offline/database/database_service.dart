// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseTableService<T> {
  final String name;

  BaseTableService(
    this.name,
  );
  final db = GetIt.instance.get<Database>();

  /// deletes records by id
  Future<int> deleteOneById(int id) async {
    return db.delete(
      name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// clear the table
  Future<void> clear() => db.delete(name);

  Future<List<T>> findManyFromDb([String keyword = '']);
}
