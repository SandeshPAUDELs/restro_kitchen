import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';

abstract class IngredientsDataSource {
  Future<void> addIngredient(String name);
  List<IngredientModels> getIngredients();
}
class IngredientsDataSourceImpl extends IngredientsDataSource {
  final Box<IngredientModels> ingredientBox;
  IngredientsDataSourceImpl({required this.ingredientBox});
  @override
  Future<void> addIngredient(String name) async {
    await ingredientBox.add(IngredientModels(name: name));
  }
  @override
  List<IngredientModels> getIngredients() {
    return ingredientBox.values.toList();
  }  
}