class ListFoodEntity {
  List<MealsListFoodEntity>? meals;

  ListFoodEntity({required this.meals});
}

class MealsListFoodEntity {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealsListFoodEntity(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});

  factory MealsListFoodEntity.fromJson(Map<String, dynamic> json) {
    return MealsListFoodEntity(
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'],
        idMeal: json['idMeal']);
  }
}
