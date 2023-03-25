import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test/domain/entity/list_food_entity.dart';
import 'package:mobile_dev_test/domain/usecase/kategori_usecase.dart';

part 'list_food_event.dart';
part 'list_food_state.dart';

class ListFoodBloc extends Bloc<ListFoodEvent, ListFoodState> {
  final ListFoodUseCase listFoodUseCase;
  ListFoodBloc(this.listFoodUseCase) : super(ListFoodInitial()) {
    on<FilterFood>((event, emit) async {
      emit(ListFoodLoading());
      try {
        final result = await listFoodUseCase.execute(event.foodKategori!);
        result.fold((failure) {
          emit(ListFoodFailed(message: failure));
        }, (response) {
          emit(ListFoodSuccess(value: response));
        });
      } catch (e) {
        debugPrint("Bloc List Food Error $e");
        emit(const ListFoodFailed(
            message: "Something Wrong, Please Try Again!"));
      }
    });
  }
}
