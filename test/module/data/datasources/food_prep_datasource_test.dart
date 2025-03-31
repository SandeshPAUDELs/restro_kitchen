import 'package:hive_project/module/data/datasources/food_prep_data_source.dart';
import 'package:hive_project/module/data/models/food/food_models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'datasources_test.mocks.dart';

void main() {
  late FoodPrepDataSourceImpl foodPrepDataSourceImpl;
  late MockBox<FoodModels> box;
  late MockBox<OtherRequiredFoodModels> otherRequiredFoodBox;

  group('Food Preparation Data Source Test', () {
    setUp(() {
      box = MockBox<FoodModels>();
      otherRequiredFoodBox = MockBox<OtherRequiredFoodModels>();
      foodPrepDataSourceImpl = FoodPrepDataSourceImpl(
        foodBox: box,
        otherRequiredFoodBox: otherRequiredFoodBox,
      );
    });

    test('description', (){
      final foodName = 'Pizza';
      final intermediateItemsModels = 2;
      final otherRequiredFoodModels = <OtherRequiredFoodModels>[];
      when(box.values).thenReturn([
        FoodModels(
          foodName: foodName,
          intermediateItemsModels: intermediateItemsModels,
          otherRequiredFoodModels: otherRequiredFoodModels,
        )
      ]);
      final result = foodPrepDataSourceImpl.getFoodPrep();
      expect(result, contains(FoodModels(
        foodName: foodName,
        intermediateItemsModels: intermediateItemsModels,
        otherRequiredFoodModels: otherRequiredFoodModels,
      )));
    });

    test('should add food preparation to the foodBox', () async {
      final foodName = 'Pizza';
      final intermediateItemsModels = 2;
      final otherRequiredFoodModels = <OtherRequiredFoodModels>[];
      when(box.add(any)).thenAnswer((_) async => 0); 
      await foodPrepDataSourceImpl.addFoodPrep(
        foodName,
        intermediateItemsModels,
        otherRequiredFoodModels,
      );

      verify(box.add(FoodModels(
        foodName: foodName,
        intermediateItemsModels: intermediateItemsModels,
        otherRequiredFoodModels: otherRequiredFoodModels,
      ))).called(1);
    });
    
    test('should add other required food to the otherRequiredFoodBox', ()  {
      final itemName = 'Tomato';
      final quantity = 2.0;
      final price = 3.0;
      when(otherRequiredFoodBox.add(any)).thenAnswer((_) async => 0); 
       foodPrepDataSourceImpl.addOtherRequiredFoodItems(
        itemName,
        quantity,
        price,
      );

      verify(otherRequiredFoodBox.add(OtherRequiredFoodModels(
        itemName: itemName,
        quantity: quantity,
        price: price,
      ))).called(1);
    });

    test('should be able to get other required food items', (){
      final itemName = 'Tomato';
      final quantity = 2.0;
      final price = 3.0;
      when(otherRequiredFoodBox.values).thenReturn([
        OtherRequiredFoodModels(
          itemName: itemName,
          quantity: quantity,
          price: price,
        )
      ]);
      final result = foodPrepDataSourceImpl.getOtherRequiredFoodItems();
      expect(result, contains(OtherRequiredFoodModels(
        itemName: itemName,
        quantity: quantity,
        price: price,
      )));

    });

  
  });
}