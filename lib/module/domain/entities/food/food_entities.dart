class FoodEntities {
  String foodName;
  int intermediateItemsModels;
  List<OtherRequiredFoodEntities> otherRequiredFoodEntities;
  FoodEntities({
    required this.foodName,
    required this.intermediateItemsModels,
    required this.otherRequiredFoodEntities,
  });

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is FoodEntities &&
        other.foodName == foodName &&
        other.intermediateItemsModels == intermediateItemsModels &&
        other.otherRequiredFoodEntities == otherRequiredFoodEntities;
  }

  @override
  int get hashCode {
    return foodName.hashCode ^
        intermediateItemsModels.hashCode ^
        otherRequiredFoodEntities.hashCode;
  }
}

class OtherRequiredFoodEntities {
  String itemName;
  double quantity;
  double price;
  OtherRequiredFoodEntities({
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is OtherRequiredFoodEntities &&
        other.itemName == itemName &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^ quantity.hashCode ^ price.hashCode;
  }
}