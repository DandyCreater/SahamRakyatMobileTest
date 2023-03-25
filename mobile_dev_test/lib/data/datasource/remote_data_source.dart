import 'package:flutter/material.dart';
import 'package:mobile_dev_test/data/model/food_detail_response_model.dart';
import 'package:mobile_dev_test/data/model/list_food_response_model.dart';
import 'package:mobile_dev_test/data/model/list_kategori_response_model.dart';

import '../../app/services.dart';

abstract class RemoteDataSource {
  Future listKategori();
  Future listFood(String foodKategori);
  Future detailFood(String foodId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  Services service = Services();

  @override
  Future listKategori() async {
    try {
      return service.request<ListKategoriResponseModel>(
          method: RequestMethods.get,
          methodRequest: "list",
          tblRequest: "list.php?c=",
          baseUrl: "https://www.themealdb.com/api/json/v1/1",
          params: "",
          models: ListKategoriResponseModel());
    } catch (e) {
      debugPrint("DataSource List Kategori Error $e");
      return e;
    }
  }

  @override
  Future listFood(String foodKategori) async {
    try {
      return service.request<ListFoodResponseModel>(
          method: RequestMethods.get,
          methodRequest: foodKategori,
          tblRequest: "filter.php?c=",
          baseUrl: "https://www.themealdb.com/api/json/v1/1",
          params: "",
          models: ListFoodResponseModel());
    } catch (e) {
      debugPrint("DataSource List Food Error $e");
      return e;
    }
  }

  @override
  Future detailFood(String foodId) async {
    try {
      return service.request<FoodDetailResponseModel>(
          method: RequestMethods.get,
          methodRequest: foodId,
          tblRequest: "lookup.php?i=",
          baseUrl: "https://www.themealdb.com/api/json/v1/1",
          params: "",
          models: FoodDetailResponseModel());
    } catch (e) {
      debugPrint("DataSource List Food Error $e");
      return e;
    }
  }
}
