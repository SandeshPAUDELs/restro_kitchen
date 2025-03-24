import 'package:hive_project/module/domain/entities/food/food_entities.dart';

abstract class FoodPrepEvent {}

class LoadFoodPrepItemsEvent extends FoodPrepEvent {}

class AddFoodPrepItemEvent extends FoodPrepEvent {
  final String foodName;
  final int intermediateItemsModels;
  final List<OtherRequiredFoodEntities> otherItems;

  AddFoodPrepItemEvent({
    required this.foodName,
    required this.intermediateItemsModels,
    required this.otherItems,
  });
}
