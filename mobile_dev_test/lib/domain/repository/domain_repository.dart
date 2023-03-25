import 'package:dartz/dartz.dart';
import 'package:mobile_dev_test/domain/entity/food_detail_entity.dart';
import 'package:mobile_dev_test/domain/entity/list_food_entity.dart';
import 'package:mobile_dev_test/domain/entity/list_kategori_entity.dart';

abstract class DomainRepository {
  Future<Either<String, ListKategoriEntity>> listKategori();
  Future<Either<String, ListFoodEntity>> listFood(String foodKategori);
  Future<Either<String, FoodDetailEntity>> detailFood(String foodId);
}
