import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_dev_test/data/model/food_detail_response_model.dart';
import 'package:mobile_dev_test/domain/entity/list_kategori_entity.dart';
import 'package:mobile_dev_test/presentation/bloc/list-kategori/list_kategori_bloc.dart';

void main() {
  late ListKategoriBloc bloc;

  test("initial State", () {
    expect(ListKategoriInitial(), ListKategoriInitial());
  });

  group("Success Response ", () {
    List<MealsListKategoriEntity>? dataList = [
      MealsListKategoriEntity(strCategory: "Beef"),
    ];

    final successData = ListKategoriEntity(meals: dataList);
    test("Testing", () {
      expect(ListKategoriSuccess(value: successData),
          ListKategoriSuccess(value: successData));
    });
  });
}
