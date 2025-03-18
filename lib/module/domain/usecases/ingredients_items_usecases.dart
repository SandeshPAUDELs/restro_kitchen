import 'package:hive_project/module/domain/entities/ingredients_items/ingredient_items_entity.dart';
import 'package:hive_project/module/domain/repositories/ingredients_items_repo.dart';

class IngredientsItemsUsecases {
  final IngredientsItemsRepo ingredientItems;
  IngredientsItemsUsecases(this.ingredientItems);

  List<IngredientItemsEntity> getIngredientsItems() {
    return ingredientItems.getIngredientsItems();
  }
  Future<void> addIngredientItems(String ingredientname, int ingredientModels, double ingredientPrice, int materialsUnit) {
    return ingredientItems.addIngredientItems(ingredientname, ingredientModels, ingredientPrice, materialsUnit);
  }
  
}