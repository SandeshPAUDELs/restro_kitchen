import 'package:hive_project/module/domain/entities/food/food_entities.dart';
import 'package:hive_project/module/domain/usecases/food_prep_usecases.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../repositories/repositories_test.mocks.dart';

void main(){
  late FoodPrepUsecases foodPrepUseCase;
  late MockFoodPrepRepo mockFoodPrepRepo;
  group('FoodPrep Usecase test', () {
    setUp(() {
      mockFoodPrepRepo = MockFoodPrepRepo();
      foodPrepUseCase = FoodPrepUsecases(mockFoodPrepRepo);
    });
    test('it should return the list of food preparation items when we call getFoodPrepItems', () {
      when(mockFoodPrepRepo.getFoodPrepItems()).thenAnswer((_) => []);
      final result = foodPrepUseCase.getFoodPrepItems();
      expect(result, []);
    });

    test('it should add a food preparation item when we call addFoodPrepItem', () async {
      when(mockFoodPrepRepo.addFoodPrepItems('Pizza', 2, [])).thenAnswer((_) async {});
      await foodPrepUseCase.addFoodPrepItems('Pizza', 2, []);
      verify(mockFoodPrepRepo.addFoodPrepItems('Pizza', 2, [])).called(1);
    });

    test('it should get other required food items when we call getOtherRequiredFoodItems', () async {
      final mockResponse = OtherRequiredFoodEntities(itemName: '', quantity: 1, price: 9); 
      when(mockFoodPrepRepo.getOtherRequiredFoodItems()).thenAnswer((_) async => mockResponse);
      final result = await foodPrepUseCase.getOtherRequiredFoodItems();
      expect(result, mockResponse);
    });

    test('it should add other required food items when we call addOtherRequiredFoodItems', () async {
      when(mockFoodPrepRepo.addOtherRequiredFoodItems('Tomato', 2, 5)).thenAnswer((_) async {});
      await foodPrepUseCase.addOtherRequiredFoodItems('Tomato', 2, 5);
      verify(mockFoodPrepRepo.addOtherRequiredFoodItems('Tomato', 2, 5)).called(1);
    });


  });
}