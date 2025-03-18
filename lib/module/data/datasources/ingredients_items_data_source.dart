import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/ingredients_items/ingredients_item_models.dart';

abstract class IngredientsItemsDataSource {
  Future<void> addIngredientItems(String ingredientname, int ingredientModels, double ingredientPrice, int materialsUnit);
  List<IngredientsItemModels> getIngredientsItems();
}
class IngredientsItemsDataSourceImpl extends IngredientsItemsDataSource {
  final Box<IngredientsItemModels> ingredientItemsBox;
  IngredientsItemsDataSourceImpl({required this.ingredientItemsBox});
  @override
  Future<void> addIngredientItems(String ingredientname, int ingredientModels, double price, int materialsUnit) async {
    await ingredientItemsBox.add(IngredientsItemModels(ingredientname: ingredientname, ingredientModels: ingredientModels, price: price, materialsUnit: materialsUnit));
  }
  @override
  List<IngredientsItemModels> getIngredientsItems() {
    return ingredientItemsBox.values.toList();
  }  
}