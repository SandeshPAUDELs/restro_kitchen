import 'package:hive_project/module/domain/entities/intermediate_items/intermediate_items_entity.dart';
import 'package:hive_project/module/domain/repositories/intermediate_items_repo.dart';

class IntermediateItemsUsecases {
  final IntermediateItemsRepo intermediateItems;
  IntermediateItemsUsecases(this.intermediateItems);

  List<IntermediateItemsEntity> getIntermediateItems() {
    return intermediateItems.getIntermediateItems();
  }
  Future<void> addIntermediateItem(String intermediateItemName, int ingredientsItemModels, int availableQuantity, int requiredQuantity, int servingQuantity) {
    return intermediateItems.addIntermediateItem(intermediateItemName, ingredientsItemModels, availableQuantity, requiredQuantity, servingQuantity);
  }   
}