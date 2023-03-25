import 'package:dartz/dartz.dart';
import 'package:mobile_dev_test/domain/entity/food_detail_entity.dart';
import 'package:mobile_dev_test/domain/entity/list_food_entity.dart';
import 'package:mobile_dev_test/domain/entity/list_kategori_entity.dart';
import 'package:mobile_dev_test/domain/repository/domain_repository.dart';

class ListKategoriUseCase {
  final DomainRepository repository;

  ListKategoriUseCase(this.repository);
  Future<Either<String, ListKategoriEntity>> execute() async {
    return repository.listKategori();
  }
}

class ListFoodUseCase {
  final DomainRepository repository;

  ListFoodUseCase(this.repository);
  Future<Either<String, ListFoodEntity>> execute(String foodKategori) async {
    return repository.listFood(foodKategori);
  }
}

class FoodDetailUseCase {
  final DomainRepository repository;

  FoodDetailUseCase(this.repository);

  Future<Either<String, FoodDetailEntity>> execute(String foodId) async {
    return repository.detailFood(foodId);
  }
}
