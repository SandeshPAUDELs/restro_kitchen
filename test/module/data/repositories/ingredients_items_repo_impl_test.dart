import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/data/repositories/ingredients_items_repo_impl.dart';
import 'package:mockito/mockito.dart';

import '../datasources/datasources_test.mocks.dart';

void main(){
  late MockIngredientsItemsDataSource mockIngredientsItemsDataSource;
  late IngredientsItemsRepoImpl ingredientsItemsRepoImpl;

  group('Ingredients Items Repo Implementation Test', (){
    setUp((){
      mockIngredientsItemsDataSource = MockIngredientsItemsDataSource();
      ingredientsItemsRepoImpl = IngredientsItemsRepoImpl(dataSource: mockIngredientsItemsDataSource);
    });

    test('should display the data available in box', (){
      when(mockIngredientsItemsDataSource.getIngredientsItems()).thenReturn([]);
      final result = ingredientsItemsRepoImpl.getIngredientsItems();
      expect(result, []);
    });

    test('should add the ingredient items in the box', () async {
      when(mockIngredientsItemsDataSource.addIngredientItems('name', 1, 77.0, 1)).thenAnswer((_) async => {});
      await ingredientsItemsRepoImpl.addIngredientItems('name', 1, 77.0, 1);
      verify(mockIngredientsItemsDataSource.addIngredientItems('name', 1, 77.0, 1));
    });
  });
}