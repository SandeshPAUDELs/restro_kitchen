import 'package:hive_project/module/domain/entities/food/food_entities.dart';
import 'package:hive_project/module/domain/repositories/food_prep_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'repositories_test.mocks.dart';

void main() {
  late FoodPrepRepo foodPrepRepo;
  late MockFoodPrepRepo mockFoodPrepRepo;
  group('FoodPrep Repo test', () {
    setUp(() {
      mockFoodPrepRepo = MockFoodPrepRepo();
      foodPrepRepo = mockFoodPrepRepo;
    });
    test('it should return the list of food preparation items when we call getFoodPrepItems', () {
      when(mockFoodPrepRepo.getFoodPrepItems()).thenAnswer((_) => []);
      final result = foodPrepRepo.getFoodPrepItems();
      expect(result, []);
    });

    test('it should add a food preparation item when we call addFoodPrepItem', () async {
      when(mockFoodPrepRepo.addFoodPrepItems('Pizza', 2, [])).thenAnswer((_) async {});
      await foodPrepRepo.addFoodPrepItems('Pizza', 2, []);
      verify(mockFoodPrepRepo.addFoodPrepItems('Pizza', 2, [])).called(1);
    });

    test('it should get other required food items when we call getOtherRequiredFoodItems', () async {
      final mockResponse = OtherRequiredFoodEntities(itemName: '', quantity: 1, price: 9); 
      when(mockFoodPrepRepo.getOtherRequiredFoodItems()).thenAnswer((_) async => mockResponse);
      final result = await foodPrepRepo.getOtherRequiredFoodItems();
      expect(result, mockResponse);
    });

    test('it should add other required food items when we call addOtherRequiredFoodItems', () async {
      when(mockFoodPrepRepo.addOtherRequiredFoodItems('Tomato', 2, 5)).thenAnswer((_) async {});
      await foodPrepRepo.addOtherRequiredFoodItems('Tomato', 2, 5);
      verify(mockFoodPrepRepo.addOtherRequiredFoodItems('Tomato', 2, 5)).called(1);
    });

    
  });
  
}