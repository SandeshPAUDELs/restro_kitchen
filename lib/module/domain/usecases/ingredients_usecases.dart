import 'package:hive_project/module/domain/entities/ingredients/ingredients_entity.dart';
import 'package:hive_project/module/domain/repositories/ingredients_repo.dart';

class IngredientsUsecases {
  final IngredientsRepo ingredient;
  IngredientsUsecases(this.ingredient);
  
  List<IngredientsEntity> getIngredients() {
    return ingredient.getIngredients();
  }
  Future<void> addIngredient(String name) {
    return ingredient.addIngredient(name);
  }
}