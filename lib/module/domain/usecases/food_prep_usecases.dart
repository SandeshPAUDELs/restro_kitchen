import 'package:hive_project/module/domain/entities/food/food_entities.dart';
import 'package:hive_project/module/domain/repositories/food_prep_repo.dart';

class FoodPrepUsecases {
  final FoodPrepRepo foodPrep;
  FoodPrepUsecases(this.foodPrep);

  List<FoodEntities> getFoodPrepItems() {
    return foodPrep.getFoodPrepItems();
  }
  Future<void> addFoodPrepItems(String foodPrepName, int intermediateItemsModels, List otherRequiredFoodEntities) {
    return foodPrep.addFoodPrepItems(foodPrepName, intermediateItemsModels, otherRequiredFoodEntities);
  }

  Future<OtherRequiredFoodEntities> getOtherRequiredFoodItems() {
    return foodPrep.getOtherRequiredFoodItems();
  }
  Future<void> addOtherRequiredFoodItems(String itemName, double quantity) {
    return foodPrep.addOtherRequiredFoodItems(itemName, quantity);
  }
}