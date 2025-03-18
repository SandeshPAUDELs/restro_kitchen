import 'package:hive_project/module/domain/entities/ingredients/ingredients_entity.dart';

abstract class IngredientsRepo {
  List<IngredientsEntity> getIngredients();
  Future<void> addIngredient(String name);
}