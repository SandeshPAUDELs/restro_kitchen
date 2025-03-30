import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/data/repositories/ingredients_repo_impl.dart';
import 'package:mockito/mockito.dart';

import '../datasources/datasources_test.mocks.dart';

void main(){
  late MockIngredientsDataSource  mockIngredientsDataSource;
  late IngredientsRepoImpl ingredientsRepoImpl;

  group('Ingredients Repo Implementation Test', (){
    setUp((){
      mockIngredientsDataSource = MockIngredientsDataSource();
      ingredientsRepoImpl = IngredientsRepoImpl(dataSource: mockIngredientsDataSource);
    });

    test('should display the data available in box', (){
      when(mockIngredientsDataSource.getIngredients()).thenReturn([]);
      final result = ingredientsRepoImpl.getIngredients();
      expect(result, []);
    });

    test('should add the ingredient in the box', () async {
      when(mockIngredientsDataSource.addIngredient('name')).thenAnswer((_) async => {});
      await ingredientsRepoImpl.addIngredient('name');
      verify(mockIngredientsDataSource.addIngredient('name'));
    });
  });
}