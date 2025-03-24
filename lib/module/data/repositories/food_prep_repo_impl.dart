import 'package:hive_project/module/data/datasources/food_prep_data_source.dart';
import 'package:hive_project/module/data/models/food/food_models.dart';
import 'package:hive_project/module/domain/entities/food/food_entities.dart';
import 'package:hive_project/module/domain/repositories/food_prep_repo.dart';

class FoodPrepRepoImpl implements FoodPrepRepo {
  final FoodPrepDataSource dataSource;
  FoodPrepRepoImpl({required this.dataSource});

  @override
  List<FoodEntities> getFoodPrepItems() {
    final foodPrepItems = dataSource.getFoodPrep();
    return foodPrepItems
        .map(
          (e) => FoodEntities(
            foodName: e.foodName,
            intermediateItemsModels: e.intermediateItemsModels,
            otherRequiredFoodEntities:
                e.otherRequiredFoodModels
                    .map(
                      (model) => OtherRequiredFoodEntities(
                        itemName: model.itemName,
                        quantity: model.quantity,
                        price: model.price,
                      ),
                    )
                    .toList(),
          ),
        )
        .toList();
  }

  @override
  Future<void> addFoodPrepItems(
    String foodPrepName,
    int intermediateItemsModels,
    List otherRequiredFoodEntities,
  ) {
    return dataSource.addFoodPrep(
      foodPrepName,
      intermediateItemsModels,
      otherRequiredFoodEntities
          .map((e) => OtherRequiredFoodModels(
                itemName: e.itemName,
                quantity: e.quantity,
                price: e.price,
              ))
          .toList(),
    );
  }

  @override
  Future<void> addOtherRequiredFoodItems(String itemName, double quantity, double price) {
    return dataSource.addOtherRequiredFoodItems(itemName, quantity, price);
  }

  @override
Future<OtherRequiredFoodEntities> getOtherRequiredFoodItems() async {
  final otherRequiredFoodItems =  dataSource.getOtherRequiredFoodItems();
  if (otherRequiredFoodItems.isEmpty) {
    throw Exception("No food items found"); 
  }
  final e = otherRequiredFoodItems.first; 
  return OtherRequiredFoodEntities(
    itemName: e.itemName,
    quantity: e.quantity,
    price: e.price,
  );
}

}
