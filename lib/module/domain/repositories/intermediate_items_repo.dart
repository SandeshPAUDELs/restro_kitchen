import 'package:hive_project/module/domain/entities/intermediate_items/intermediate_items_entity.dart';

abstract class IntermediateItemsRepo {
  List<IntermediateItemsEntity> getIntermediateItems();
  Future<void> addIntermediateItem(String intermediateItemName, int ingredientsItemModels, int availableQuantity, int requiredQuantity, int servingQuantity);
}