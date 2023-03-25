import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test/domain/entity/food_detail_entity.dart';
import 'package:mobile_dev_test/domain/usecase/kategori_usecase.dart';

part 'food_detail_event.dart';
part 'food_detail_state.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  final FoodDetailUseCase foodDetailUseCase;
  FoodDetailBloc(this.foodDetailUseCase) : super(FoodDetailInitial()) {
    on<SeeDetails>((event, emit) async {
      emit(FoodDetailLoading());
      try {
        final result = await foodDetailUseCase.execute(event.foodId!);
        result.fold((failure) {
          emit(FoodDetailFailed(message: failure));
        }, (response) {
          emit(FoodDetailSuccess(value: response));
        });
      } catch (e) {
        debugPrint("Bloc Food Detail Error $e");
        emit(const FoodDetailFailed(
            message: "Something Wrong! Please Try Again Later"));
      }
    });
  }
}
