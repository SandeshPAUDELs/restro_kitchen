import 'package:hive_project/module/domain/usecases/ingredients_usecases.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../repositories/repositories_test.mocks.dart';

void main() {
  late IngredientsUsecases ingredientsUsecases;
  late MockIngredientsRepo mockIngredientsRepo;

  group('Ingredients Usecases Test', () {
    setUp(() {
      mockIngredientsRepo = MockIngredientsRepo();
      ingredientsUsecases = IngredientsUsecases(mockIngredientsRepo);
    });

    test('should get the ingredients ', () {
      when(mockIngredientsRepo.getIngredients()).thenAnswer((_) => []);
      final result = ingredientsUsecases.getIngredients();
      expect(result, []);
    });

    test('should add the ingredients in the list', () {
      when(
        mockIngredientsRepo.addIngredient('name'),
      ).thenAnswer((_) async => {});
      ingredientsUsecases.addIngredient('name');
      verify(mockIngredientsRepo.addIngredient('name'));
    });
  });
}
