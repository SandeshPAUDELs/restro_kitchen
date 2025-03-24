import 'package:hive_project/module/domain/entities/food/food_entities.dart';

abstract class FoodPrepRepo {
  List<FoodEntities> getFoodPrepItems();
  Future<void> addFoodPrepItems(String foodPrepName, int intermediateItemsModels, List otherRequiredFoodEntities);

  Future<OtherRequiredFoodEntities> getOtherRequiredFoodItems();
  // Future<List<OtherRequiredFoodEntities>> getOtherRequiredFoodItems();

  Future<void> addOtherRequiredFoodItems(String itemName, double quantity);
}