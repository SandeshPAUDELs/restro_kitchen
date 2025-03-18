import 'package:hive_project/module/data/datasources/ingredients_items_data_source.dart';
import 'package:hive_project/module/domain/entities/ingredients_items/ingredient_items_entity.dart';
import 'package:hive_project/module/domain/repositories/ingredients_items_repo.dart';

class IngredientsItemsRepoImpl extends IngredientsItemsRepo{
  final IngredientsItemsDataSource dataSource;
  IngredientsItemsRepoImpl({required this.dataSource});

  @override
  List<IngredientItemsEntity> getIngredientsItems() {
    final ingredientsItems = dataSource.getIngredientsItems();
    return ingredientsItems.map((e) => IngredientItemsEntity(ingredientname: e.ingredientname, ingredientModels: e.ingredientModels, price: e.price, materialsUnit: e.materialsUnit)).toList();
  }
  
  @override
  Future<void> addIngredientItems(String ingredientname, int ingredientModels, double ingredientPrice, int materialsUnit) {
    return dataSource.addIngredientItems(ingredientname, ingredientModels, ingredientPrice, materialsUnit);
  }
  
}