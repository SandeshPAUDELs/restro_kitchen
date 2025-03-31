import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/domain/repositories/ingredients_items_repo.dart';
import 'package:mockito/mockito.dart';
import 'repositories_test.mocks.dart';

void main(){
  late IngredientsItemsRepo ingredientsItemsRepo;
  late MockIngredientsItemsRepo mockIngredientsItemsRepo;
  group('IngredientsItems Repo test', (){
    setUp((){
      mockIngredientsItemsRepo = MockIngredientsItemsRepo();
      ingredientsItemsRepo = mockIngredientsItemsRepo;
    });
    test('it should return the list of ingredients items when we call getIngredientsItems', (){
      when(mockIngredientsItemsRepo.getIngredientsItems()).thenAnswer((_) => []);
      final result = ingredientsItemsRepo.getIngredientsItems();
      expect(result, []);
    });

    test('it should add an ingredient item when we call addIngredientItem', () async {
      when(mockIngredientsItemsRepo.addIngredientItems('ingredientname', 1, 90.0, 1)).thenAnswer((_) async {});
      await ingredientsItemsRepo.addIngredientItems('ingredientname', 1, 90.0, 1);
      verify(mockIngredientsItemsRepo.addIngredientItems('ingredientname', 1, 90.0, 1));
    });

    test('it should increase or decrease the price of an ingredient item when we call updateIngredientItem', () {
      when(mockIngredientsItemsRepo.updateIngredientItem('ingredientName', 1, 90.0)).thenAnswer((_) {});
      ingredientsItemsRepo.updateIngredientItem('ingredientName', 1, 90.0);
      verify(mockIngredientsItemsRepo.updateIngredientItem('ingredientName', 1, 90.0));
    });
  });
}