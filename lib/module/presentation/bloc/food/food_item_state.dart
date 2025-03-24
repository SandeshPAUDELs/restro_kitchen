import 'package:hive_project/module/domain/entities/food/food_entities.dart';

abstract class FoodPrepState {}

class FoodPrepInitial extends FoodPrepState {}

class FoodPrepLoading extends FoodPrepState {}

class FoodPrepLoaded extends FoodPrepState {
  final List<FoodEntities> foods;
  FoodPrepLoaded(this.foods);
}

class FoodPrepError extends FoodPrepState {
  final String message;
  FoodPrepError(this.message);
}
