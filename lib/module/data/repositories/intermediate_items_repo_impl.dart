import 'package:hive_project/module/data/datasources/intermediate_items_data_source.dart';
import 'package:hive_project/module/domain/entities/intermediate_items/intermediate_items_entity.dart';
import 'package:hive_project/module/domain/repositories/intermediate_items_repo.dart';

class IntermediateItemsRepoImpl extends IntermediateItemsRepo {
  final IntermediateItemsDataSource dataSource;
  IntermediateItemsRepoImpl({required this.dataSource});
  @override
  List<IntermediateItemsEntity> getIntermediateItems() {
    final intermediateItems = dataSource.getIntermediateItems();
    return intermediateItems
        .map(
          (e) => IntermediateItemsEntity(
            intermediateItemName: e.intermediateItemName,
            ingredientsItemModels: e.ingredientsItemModels,
            availableQuantity: e.availableQuantity,
            requiredQuantity: e.requiredQuantity.toInt(),
            servingQuantity: e.servingQuantity,
          ),
        )
        .toList();
  }

  @override
  Future<void> addIntermediateItem(
    String intermediateItemName,
    int ingredientsItemModels,
    int availableQuantity,
    int requiredQuantity,
    int servingQuantity,
  ) {
    return dataSource.addIntermediateItem(
      intermediateItemName,
      ingredientsItemModels,
      availableQuantity,
      requiredQuantity,
      servingQuantity,
    );
  }

  // serving quantity increment and decrement
  @override
  void updateIntermediateItem(String intermediateItemName, int newServingQuantity, int newRequiredQuantity) {
    final intermediateItems = dataSource.getIntermediateItems();

    for (var item in intermediateItems) {
      if (item.intermediateItemName == intermediateItemName) {
        item.servingQuantity = newServingQuantity;
        item.requiredQuantity = newRequiredQuantity;
        item.save();
        break;
      }
    }
  }
}
