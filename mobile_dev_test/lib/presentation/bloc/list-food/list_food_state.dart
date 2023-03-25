part of 'list_food_bloc.dart';

abstract class ListFoodState extends Equatable {
  const ListFoodState();

  @override
  List<Object> get props => [];
}

class ListFoodInitial extends ListFoodState {}

class ListFoodLoading extends ListFoodState {}

class ListFoodSuccess extends ListFoodState {
  final ListFoodEntity? value;

  const ListFoodSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class ListFoodFailed extends ListFoodState {
  final String? message;

  const ListFoodFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
