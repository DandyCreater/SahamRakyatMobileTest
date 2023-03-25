import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_test/data/model/food_detail_response_model.dart';
import 'package:mobile_dev_test/data/model/list_food_response_model.dart';
import 'package:mobile_dev_test/data/model/list_kategori_response_model.dart';
import 'package:mobile_dev_test/domain/entity/food_detail_entity.dart';
import 'package:mobile_dev_test/domain/entity/list_food_entity.dart';
import 'package:mobile_dev_test/domain/entity/list_kategori_entity.dart';
import 'package:mobile_dev_test/domain/repository/domain_repository.dart';

class DataRepository extends DomainRepository {
  final RemoteDataSource remoteDataSource;

  DataRepository({required this.remoteDataSource});

  @override
  Future<Either<String, ListKategoriEntity>> listKategori() async {
    try {
      ListKategoriResponseModel result = await remoteDataSource.listKategori();
      if (result.meals != null) {
        return right(result.toEntity());
      } else {
        return left("Get Data Meals Error");
      }
    } catch (e) {
      debugPrint("Repository Error $e");
      return const Left("Something Wrong, Please Try Again!");
    }
  }

  @override
  Future<Either<String, ListFoodEntity>> listFood(String foodKategori) async {
    try {
      ListFoodResponseModel result =
          await remoteDataSource.listFood(foodKategori);
      if (result.meals != null) {
        return right(result.toEntity());
      } else {
        return left("Get Data Food Error");
      }
    } catch (e) {
      debugPrint("Repository Error $e");
      return const Left("Something Wrong, Please Try Again!");
    }
  }

  @override
  Future<Either<String, FoodDetailEntity>> detailFood(String foodId) async {
    try {
      FoodDetailResponseModel result =
          await remoteDataSource.detailFood(foodId);
      if (result.meals != null) {
        return right(result.toEntity());
      } else {
        return left("Get Data Food Error");
      }
    } catch (e) {
      debugPrint("Repository Error $e");
      return const Left("Something Wrong, Please Try Again!");
    }
  }
}
