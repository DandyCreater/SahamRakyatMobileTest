part of 'list_food_bloc.dart';

abstract class ListFoodEvent extends Equatable {
  const ListFoodEvent();

  @override
  List<Object> get props => [];
}

class FilterFood extends ListFoodEvent {
  final String? foodKategori;

  const FilterFood({required this.foodKategori});

  @override
  // TODO: implement props
  List<Object> get props => [foodKategori!];
}
