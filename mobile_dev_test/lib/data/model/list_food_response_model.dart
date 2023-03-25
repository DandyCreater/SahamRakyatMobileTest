import 'package:mobile_dev_test/domain/entity/list_food_entity.dart';

import '../utils/model.dart';

class ListFoodResponseModel extends Model {
  List<Meals>? meals;

  @override
  void fromJson(Map<String, dynamic> json) {
    meals = json['meals'] != null
        ? List<Meals>.from(json['meals'].map((x) => Meals.fromJson(x)))
        : null;
  }

  ListFoodEntity toEntity() {
    return ListFoodEntity(
        meals: this.meals != null
            ? this.meals!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Meals {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meals(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'],
        idMeal: json['idMeal']);
  }
  MealsListFoodEntity toEntity() {
    return MealsListFoodEntity(
        strMeal: strMeal, strMealThumb: strMealThumb, idMeal: idMeal);
  }
}
