class ListKategoriEntity {
  List<MealsListKategoriEntity>? meals;

  ListKategoriEntity({required this.meals});
}

class MealsListKategoriEntity {
  String? strCategory;

  MealsListKategoriEntity({required this.strCategory});

  factory MealsListKategoriEntity.fromJson(Map<String, dynamic> json) {
    return MealsListKategoriEntity(strCategory: json['strCategory']);
  }
}
