import 'package:hive_project/module/data/datasources/ingredients_data_source.dart';
import 'package:hive_project/module/domain/entities/ingredients/ingredients_entity.dart';
import 'package:hive_project/module/domain/repositories/ingredients_repo.dart';

class IngredientsRepoImpl extends IngredientsRepo {
  final IngredientsDataSource dataSource;
  IngredientsRepoImpl({required this.dataSource});

  @override
  List<IngredientsEntity> getIngredients() {
    final ingredients =  dataSource.getIngredients();
    return ingredients.map((e) => IngredientsEntity(name: e.name)).toList();
  }

  @override
  Future<void> addIngredient(String name) {
    return dataSource.addIngredient(name);
  }
}