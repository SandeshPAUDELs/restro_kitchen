import 'package:hive_flutter/hive_flutter.dart';
part 'ingredients_item_models.g.dart';

@HiveType(typeId: 1)
class IngredientsItemModels extends HiveObject {
  @HiveField(0)
  String ingredientname;
  @HiveField(1)
  int ingredientModels;
  // IngredientModels ingredientModels;
  @HiveField(2)
  double price;
  @HiveField(3)
  int materialsUnit;

  IngredientsItemModels({
    required this.ingredientname,
    required this.ingredientModels,
    required this.price,
    required this.materialsUnit,
  });
}
