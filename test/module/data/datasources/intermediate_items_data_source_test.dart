import 'package:hive_project/module/data/datasources/intermediate_items_data_source.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'datasources_test.mocks.dart';

void main(){
  late IntermediateItemsDataSourceImpl intermediateItemsDataSourceImpl;
  late MockBox<IntermediateItemsModels> box;


  group('Intermediate Items Data Source Implementation', (){
    setUp((){
      box = MockBox<IntermediateItemsModels>();
      intermediateItemsDataSourceImpl = IntermediateItemsDataSourceImpl(intermediateItemsBox: box);
    });

    test('should display the data available in box', (){
      when(box.values).thenReturn([IntermediateItemsModels(intermediateItemName: 'name', ingredientsItemModels: 1, availableQuantity: 1, requiredQuantity: 1, servingQuantity: 1)]);
      final result = intermediateItemsDataSourceImpl.getIntermediateItems();
      expect(result, contains(IntermediateItemsModels(intermediateItemName: 'name', ingredientsItemModels: 1, availableQuantity: 1, requiredQuantity: 1, servingQuantity: 1))); 
    });

    test('should add the intermediate item in the box', () async {
      when(box.add(any)).thenAnswer((_) async => 0); // 1 le index value dincha
      await intermediateItemsDataSourceImpl.addIntermediateItem('name', 1, 1, 1, 1);
      verify(box.add(IntermediateItemsModels(intermediateItemName: 'name', ingredientsItemModels: 1, availableQuantity: 1, requiredQuantity: 1, servingQuantity: 1)));
    });
  });
}