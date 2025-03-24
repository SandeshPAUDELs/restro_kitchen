import 'package:hive/hive.dart';
part 'food_models.g.dart';

@HiveType(typeId: 3)
class FoodModels extends HiveObject {
  @HiveField(0)
  String foodName;
  @HiveField(1)
  int intermediateItemsModels;
  @HiveField(2)
  List<OtherRequiredFoodModels> otherRequiredFoodModels;


  FoodModels({
    required this.foodName,
    required this.intermediateItemsModels,
    required this.otherRequiredFoodModels,

  });
}

@HiveType(typeId: 4)
class OtherRequiredFoodModels extends HiveObject {
  @HiveField(0)
  String itemName;
  @HiveField(1)
  double quantity;
  @HiveField(2)
  double price;

  OtherRequiredFoodModels({
    required this.itemName,
    required this.quantity,
    required this.price,
  });
}