import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';

abstract class IntermediateItemsDataSource {
  Future<void> addIntermediateItem(String intermediateItemName, int ingredientsItemModels, int availableQuantity, int requiredQuantity, int servingQuantity);
  List<IntermediateItemsModels> getIntermediateItems();

}
class IntermediateItemsDataSourceImpl extends IntermediateItemsDataSource {
  final Box<IntermediateItemsModels> intermediateItemsBox;
  IntermediateItemsDataSourceImpl({required this.intermediateItemsBox});
  @override
  Future<void> addIntermediateItem(String intermediateItemName, int ingredientsItemModels, int availableQuantity, int requiredQuantity, int servingQuantity) async {
    await intermediateItemsBox.add(IntermediateItemsModels(intermediateItemName: intermediateItemName, ingredientsItemModels: ingredientsItemModels, availableQuantity: availableQuantity, requiredQuantity: requiredQuantity, servingQuantity: servingQuantity));
  }
  @override
  List<IntermediateItemsModels> getIntermediateItems() {
    return intermediateItemsBox.values.toList();
  }  
}