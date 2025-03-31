import 'package:hive_project/module/domain/usecases/intermediate_items_usecases.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../repositories/repositories_test.mocks.dart';

void main(){
  late IntermediateItemsUsecases intermediateItemsUsecases;
  late MockIntermediateItemsRepo mockIntermediateItemsRepo;

  group('Intermediate Items Usecases test', (){
    setUp((){
      mockIntermediateItemsRepo = MockIntermediateItemsRepo();
      intermediateItemsUsecases = IntermediateItemsUsecases(mockIntermediateItemsRepo);
    });

    test('it should get the intermediate items', (){
      when(mockIntermediateItemsRepo.getIntermediateItems()).thenAnswer((_) => []);
      final result = intermediateItemsUsecases.getIntermediateItems();
      expect(result, []);
    });

    test('it should add an intermediate item', () async {
      when(mockIntermediateItemsRepo.addIntermediateItem('intermediateItemName', 1, 1, 1, 1)).thenAnswer((_) async => {});
      await intermediateItemsUsecases.addIntermediateItem('intermediateItemName', 1, 1, 1, 1);
      verify(mockIntermediateItemsRepo.addIntermediateItem('intermediateItemName', 1, 1, 1, 1));
    });

    test('it should update an intermediate item', () {
      when(mockIntermediateItemsRepo.updateIntermediateItem('intermediateItemName', 1, 1)).thenAnswer((_) => {});
      intermediateItemsUsecases.updateIntermediateItem('intermediateItemName', 1, 1);
      verify(mockIntermediateItemsRepo.updateIntermediateItem('intermediateItemName', 1, 1));
    });

  });
}