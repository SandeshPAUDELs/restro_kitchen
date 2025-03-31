import 'package:hive_project/module/data/models/food/food_models.dart';
import 'package:hive_project/module/data/repositories/food_prep_repo_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../datasources/datasources_test.mocks.dart';

void main(){
  late FoodPrepRepoImpl foodPrepRepoImpl;
  late MockFoodPrepDataSource mockFoodPrepDataSource;

  group('Food Preparation Repo Implementation Test', (){
    setUp((){
      mockFoodPrepDataSource = MockFoodPrepDataSource();
      foodPrepRepoImpl = FoodPrepRepoImpl(dataSource: mockFoodPrepDataSource);
    });

    test('should display the data available in box', (){
      when(mockFoodPrepDataSource.getFoodPrep()).thenReturn([]);
      final result = foodPrepRepoImpl.getFoodPrepItems();
      expect(result, []);
    });

    test('should add the food preparation in the box', () async {
      when(mockFoodPrepDataSource.addFoodPrep('name', 1, [])).thenAnswer((_) async => {});
      await foodPrepRepoImpl.addFoodPrepItems('name', 1, []);
      verify(mockFoodPrepDataSource.addFoodPrep('name', 1, []));
    });

    test('should throw an exception when no otherRequired items are found', () async {
      when(mockFoodPrepDataSource.getOtherRequiredFoodItems()).thenReturn([]);
      expect(
      () async => await foodPrepRepoImpl.getOtherRequiredFoodItems(),
      throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('No food items found'))),
      );
    });

    test('should return the first otherRequired item when items are available', () async {
      when(mockFoodPrepDataSource.getOtherRequiredFoodItems()).thenReturn([
      OtherRequiredFoodModels(itemName: 'item1', quantity: 2.0, price: 10.0),
      OtherRequiredFoodModels(itemName: 'item2', quantity: 3.0, price: 15.0),
      ]);
      final result = await foodPrepRepoImpl.getOtherRequiredFoodItems();
      expect(result.itemName, 'item1');
      expect(result.quantity, 2.0);
      expect(result.price, 10.0);
    });

    test('Should add other required food items', (){
      when(mockFoodPrepDataSource.addOtherRequiredFoodItems('name', 1, 1)).thenAnswer((_) async => {});
      foodPrepRepoImpl.addOtherRequiredFoodItems('name', 1, 1);
      verify(mockFoodPrepDataSource.addOtherRequiredFoodItems('name', 1, 1));
    });
  });

}