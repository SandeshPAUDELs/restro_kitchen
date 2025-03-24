import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/food/food_models.dart';

abstract class FoodPrepDataSource {
  Future<void> addFoodPrep(String foodName, int intermediateItemsModels, List<OtherRequiredFoodModels> otherRequiredFoodModels);
  List<FoodModels> getFoodPrep();
  Future<void> addOtherRequiredFoodItems(String itemName, double quantity);
  List<OtherRequiredFoodModels> getOtherRequiredFoodItems();
}

class FoodPrepDataSourceImpl extends FoodPrepDataSource {
  final Box<FoodModels> foodBox;
  final Box<OtherRequiredFoodModels> otherRequiredFoodBox;
  FoodPrepDataSourceImpl({required this.foodBox, required this.otherRequiredFoodBox});

  @override
  Future<void> addFoodPrep(String foodName, int intermediateItemsModels, List<OtherRequiredFoodModels> otherRequiredFoodModels) async {
    await foodBox.add(FoodModels(foodName: foodName, intermediateItemsModels: intermediateItemsModels, otherRequiredFoodModels: otherRequiredFoodModels));
  }

  @override
  List<FoodModels> getFoodPrep() {
    return foodBox.values.toList();
  }

  @override
  Future<void> addOtherRequiredFoodItems(String itemName, double quantity) async {
    await otherRequiredFoodBox.add(OtherRequiredFoodModels(itemName: itemName, quantity: quantity));
  }

  @override
  List<OtherRequiredFoodModels> getOtherRequiredFoodItems() {
    return otherRequiredFoodBox.values.toList();
  }

}