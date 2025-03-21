import 'package:hive_flutter/hive_flutter.dart';
part 'intermediate_item_models.g.dart';
@HiveType(typeId: 2)
class IntermediateItemsModels extends HiveObject{
  @HiveField(0)
  String intermediateItemName;
  @HiveField(1)
  int ingredientsItemModels;
  @HiveField(2)
  int availableQuantity;
  @HiveField(3)
  int requiredQuantity;
  @HiveField(4)
  int servingQuantity;

  IntermediateItemsModels({
    required this.intermediateItemName,
    required this.ingredientsItemModels,
    required this.availableQuantity,
    required this.requiredQuantity,
    required this.servingQuantity,
  });
}