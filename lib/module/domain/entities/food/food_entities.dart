class FoodEntities {
  String foodName;
  int intermediateItemsModels;
  List<OtherRequiredFoodEntities> otherRequiredFoodEntities;
  FoodEntities({
    required this.foodName,
    required this.intermediateItemsModels,
    required this.otherRequiredFoodEntities,
  });
}

class OtherRequiredFoodEntities {
  String itemName;
  double quantity;
  OtherRequiredFoodEntities({
    required this.itemName,
    required this.quantity,
  });
}