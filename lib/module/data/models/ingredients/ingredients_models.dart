import 'package:hive_flutter/hive_flutter.dart';
part 'ingredients_models.g.dart';
@HiveType(typeId: 0)
class IngredientModels extends HiveObject {
  @HiveField(0)
  String name;
  IngredientModels({required this.name});
}