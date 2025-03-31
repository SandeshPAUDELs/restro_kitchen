import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/data/datasources/ingredients_items_data_source.dart';
import 'package:hive_project/module/data/models/ingredients_items/ingredients_item_models.dart';
import 'package:mockito/mockito.dart';

import 'datasources_test.mocks.dart';

void main(){
  late IngredientsItemsDataSourceImpl ingredientsItemsDataSourceImpl;
  late MockBox<IngredientsItemModels> box;

  group('Ingredients Items Datasource testing', (){
    setUp((){
      box = MockBox<IngredientsItemModels>();
      ingredientsItemsDataSourceImpl = IngredientsItemsDataSourceImpl(ingredientItemsBox: box);
    });

    test('should display the data present in ingredientItemBox', (){
      when(box.values).thenReturn([IngredientsItemModels(ingredientname: '', ingredientModels: 1, price: 77.0, materialsUnit: 1)]);
      final result = ingredientsItemsDataSourceImpl.getIngredientsItems();
      expect(result, contains(IngredientsItemModels(ingredientname: '', ingredientModels: 1, price: 77.0, materialsUnit: 1)));
    });

    test('should be able to add ingredients itsms in the ingredientItemsBox', (){
      when(box.add(any)).thenAnswer((_) async => 1); // 0 is a index value
       ingredientsItemsDataSourceImpl.addIngredientItems('name', 1, 77.0, 1);
      verify(box.add(IngredientsItemModels(ingredientname: 'name', ingredientModels: 1, price: 77.0, materialsUnit: 1)));

    });
  });

}