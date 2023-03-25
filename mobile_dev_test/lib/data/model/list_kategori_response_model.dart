// ignore_for_file: unnecessary_this

import 'package:mobile_dev_test/domain/entity/list_kategori_entity.dart';

import '../utils/model.dart';

class ListKategoriResponseModel extends Model {
  List<Meals>? meals;

  @override
  void fromJson(Map<String, dynamic> json) {
    meals = json['meals'] != null
        ? List<Meals>.from(json['meals'].map((x) => Meals.fromJson(x)))
        : null;
  }

  ListKategoriEntity toEntity() {
    return ListKategoriEntity(
        meals: this.meals != null
            ? this.meals!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Meals {
  String? strCategory;

  Meals({required this.strCategory});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(strCategory: json['strCategory']);
  }
  MealsListKategoriEntity toEntity() {
    return MealsListKategoriEntity(strCategory: this.strCategory);
  }
}
