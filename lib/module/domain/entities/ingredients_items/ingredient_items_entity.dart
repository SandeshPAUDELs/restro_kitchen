class IngredientItemsEntity {
  String ingredientname;
  int ingredientModels;
  double price;
  int materialsUnit;

  IngredientItemsEntity({
    required this.ingredientname,
    required this.ingredientModels,
    required this.price,
    required this.materialsUnit,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IngredientItemsEntity &&
        other.ingredientname == ingredientname &&
        other.ingredientModels == ingredientModels &&
        other.price == price &&
        other.materialsUnit == materialsUnit;
  }

  @override
  int get hashCode =>
      ingredientname.hashCode ^
      ingredientModels.hashCode ^
      price.hashCode ^
      materialsUnit.hashCode;
}
