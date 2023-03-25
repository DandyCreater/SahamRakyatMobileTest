part of 'food_detail_bloc.dart';

abstract class FoodDetailState extends Equatable {
  const FoodDetailState();

  @override
  List<Object> get props => [];
}

class FoodDetailInitial extends FoodDetailState {}

class FoodDetailLoading extends FoodDetailState {}

class FoodDetailSuccess extends FoodDetailState {
  final FoodDetailEntity? value;
  const FoodDetailSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class FoodDetailFailed extends FoodDetailState {
  final String? message;

  const FoodDetailFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
