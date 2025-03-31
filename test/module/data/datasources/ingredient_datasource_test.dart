// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_project/module/data/datasources/ingredients_data_source.dart';
// import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';
// import 'package:mockito/mockito.dart';

// import 'datasources_test.mocks.dart';

// void main() {
//   late IngredientsDataSourceImpl ingredientsDataSourceImpl;
//   late MockBox<IngredientModels> box;


//   group('Ingredient Data Source Implementation', (){
//     setUp((){
//     box = MockBox<IngredientModels>();
//     ingredientsDataSourceImpl = IngredientsDataSourceImpl(ingredientBox: box);
//   });

//   test('should display the data available in box', (){
//     when(box.values).thenReturn([IngredientModels(name: 'name')]);
//     final result = ingredientsDataSourceImpl.getIngredients();
//     expect(result, contains([IngredientModels(name: 'name')]));
//   });
//   });
// }
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/data/datasources/ingredients_data_source.dart';
import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';
import 'package:mockito/mockito.dart';
import 'datasources_test.mocks.dart';

void main() {
  late IngredientsDataSourceImpl ingredientsDataSourceImpl;
  late MockBox<IngredientModels> box;

  group('Ingredient Data Source Implementation', () {
    setUp(() {
      box = MockBox<IngredientModels>();
      ingredientsDataSourceImpl = IngredientsDataSourceImpl(ingredientBox: box);
    });

    test('should display the data available in box', () {
      when(box.values).thenReturn([IngredientModels(name: 'name')]);
      final result = ingredientsDataSourceImpl.getIngredients();
      expect(result, contains(IngredientModels(name: 'name'))); 
    });

    test('should add the ingredient in the box', () async {
      when(box.add(any)).thenAnswer((_) async => 0); // 0 is a placeholder that returns a valid index
      // it similates the behaviour of read add method, which returns the index of the added item
      await ingredientsDataSourceImpl.addIngredient('name');
      verify(box.add(IngredientModels(name: 'name')));
    });

  });
}
