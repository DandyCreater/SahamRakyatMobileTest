part of 'list_kategori_bloc.dart';

abstract class ListKategoriState extends Equatable {
  const ListKategoriState();

  @override
  List<Object> get props => [];
}

class ListKategoriInitial extends ListKategoriState {}

class ListKategoriLoading extends ListKategoriState {}

class ListKategoriSuccess extends ListKategoriState {
  final ListKategoriEntity? value;

  const ListKategoriSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class ListKategoriFailed extends ListKategoriState {
  final String? message;

  const ListKategoriFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
