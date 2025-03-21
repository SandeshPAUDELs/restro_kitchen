
import 'package:hive_project/module/domain/entities/ingredients_items/ingredient_items_entity.dart';

abstract class IngredientsItemsRepo {
  List<IngredientItemsEntity> getIngredientsItems();
  Future<void> addIngredientItems(String ingredientname, int ingredientModels, double ingredientPrice, int materialsUnit);
// price  chang गर्ने 
  void updateIngredientItem(String ingredientName, int newMaterialsUnit, double newPrice);


}