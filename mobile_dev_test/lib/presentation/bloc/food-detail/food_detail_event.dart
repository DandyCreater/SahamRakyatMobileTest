part of 'food_detail_bloc.dart';

abstract class FoodDetailEvent extends Equatable {
  const FoodDetailEvent();

  @override
  List<Object> get props => [];
}

class SeeDetails extends FoodDetailEvent {
  final String? foodId;

  const SeeDetails({required this.foodId});

  @override
  // TODO: implement props
  List<Object> get props => [foodId!];
}
