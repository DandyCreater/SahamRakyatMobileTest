import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test/domain/entity/list_kategori_entity.dart';
import 'package:mobile_dev_test/domain/usecase/kategori_usecase.dart';

part 'list_kategori_event.dart';
part 'list_kategori_state.dart';

class ListKategoriBloc extends Bloc<ListKategoriEvent, ListKategoriState> {
  final ListKategoriUseCase listKategoriUseCase;
  ListKategoriBloc(this.listKategoriUseCase) : super(ListKategoriInitial()) {
    on<FetchKategori>((event, emit) async {
      emit(ListKategoriLoading());
      try {
        final result = await listKategoriUseCase.execute();
        result.fold((failure) {
          emit(ListKategoriFailed(message: failure));
        }, (response) {
          emit(ListKategoriSuccess(value: response));
        });
      } catch (e) {
        debugPrint("Bloc List Ketegori Error $e");
        emit(const ListKategoriFailed(
            message: "Something Wrong, Please Try Again!"));
      }
    });
  }
}
