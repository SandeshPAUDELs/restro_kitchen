import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/domain/repositories/ingredients_repo.dart';
import 'package:mockito/mockito.dart';

import 'repositories_test.mocks.dart';

void main() {
  late IngredientsRepo ingredientsRepo;
  late MockIngredientsRepo mockIngredientsRepo;

  group('IngredientsRepo', () {
    setUp(() {
      mockIngredientsRepo = MockIngredientsRepo();
      ingredientsRepo = mockIngredientsRepo;
    });

    test('it should return the list of ingredients when we call getIngredients', () {
      when(mockIngredientsRepo.getIngredients()).thenAnswer((_)  => []);
      final result = ingredientsRepo.getIngredients();
      expect(result, []);
    });

    test('it should add an ingredient when we call addIngredient', () async {
    when(mockIngredientsRepo.addIngredient('name')).thenAnswer((_) async {});
    await ingredientsRepo.addIngredient('name');
    verify(mockIngredientsRepo.addIngredient('name'));
    
  });
  });
}