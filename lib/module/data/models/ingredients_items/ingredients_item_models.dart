import 'package:hive_flutter/hive_flutter.dart';
part 'ingredients_item_models.g.dart';

@HiveType(typeId: 1)
class IngredientsItemModels extends HiveObject {
  @HiveField(0)
  String ingredientname;
  @HiveField(1)
  int ingredientModels;
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IngredientsItemModels &&
        other.ingredientname == ingredientname &&
        other.ingredientModels == ingredientModels &&
        other.price == price &&
        other.materialsUnit == materialsUnit;
  }

  @override
  int get hashCode {
    return ingredientname.hashCode ^
        ingredientModels.hashCode ^
        price.hashCode ^
        materialsUnit.hashCode;
  }
}
