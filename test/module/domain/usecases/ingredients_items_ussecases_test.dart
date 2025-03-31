import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/domain/usecases/ingredients_items_usecases.dart';
import 'package:mockito/mockito.dart';

import '../repositories/repositories_test.mocks.dart';

void main() {
  late IngredientsItemsUsecases ingredientsItemsUsecases;
  late MockIngredientsItemsRepo mockIngredientsItemsRepo;

  group('Ingredients Items Usecases Test', () {
    setUp(() {
      mockIngredientsItemsRepo = MockIngredientsItemsRepo();
      ingredientsItemsUsecases = IngredientsItemsUsecases(mockIngredientsItemsRepo);
    });

    test('should get the ingredients items', () {
      when(mockIngredientsItemsRepo.getIngredientsItems()).thenAnswer((_) => []);
      final result = ingredientsItemsUsecases.getIngredientsItems();
      expect(result, []);
    });

    test('should add the ingredients items in the list', () {
      when(
        mockIngredientsItemsRepo.addIngredientItems('name', 1, 90.0, 1),
      ).thenAnswer((_) async => {});
      ingredientsItemsUsecases.addIngredientItems('name', 1, 90.0, 1);
      verify(mockIngredientsItemsRepo.addIngredientItems('name', 1, 90.0, 1));
    });

    test('should update the ingredients items in the list', () {
      when(
        mockIngredientsItemsRepo.updateIngredientItem('name', 1, 90.0),
      ).thenAnswer((_) => {});
      ingredientsItemsUsecases.updateIngredientItem('name', 1, 90.0);
      verify(mockIngredientsItemsRepo.updateIngredientItem('name', 1, 90.0));
    });
  });
}