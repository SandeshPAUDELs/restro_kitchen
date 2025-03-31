import 'package:hive_project/module/domain/repositories/intermediate_items_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'repositories_test.mocks.dart';

void main() {
  late IntermediateItemsRepo intermediateItemsRepo;
  late MockIntermediateItemsRepo mockIntermediateItemsRepo;

  group('Intermediate Items Repository Tests', () {
    setUp(() {
      mockIntermediateItemsRepo = MockIntermediateItemsRepo();
      intermediateItemsRepo = mockIntermediateItemsRepo;
    });

    test(
      'it should return the list of intermediate items when we call getIntermediateItems',
      () {
        when(
          mockIntermediateItemsRepo.getIntermediateItems(),
        ).thenAnswer((_) => []);
        final result = intermediateItemsRepo.getIntermediateItems();
        expect(result, []);
      },
    );

    test(
      'it should add an intermediate item when we call addIntermediateItem',
      () async {
        when(
          mockIntermediateItemsRepo
              .addIntermediateItem('intermediateItemName', 1, 1, 1, 1)
              .then((_) async => {}),
        );
        await intermediateItemsRepo.addIntermediateItem(
          'intermediateItemName',
          1,
          1,
          1,
          1,
        );
        verify(
          mockIntermediateItemsRepo.addIntermediateItem(
            'intermediateItemName',
            1,
            1,
            1,
            1,
          ),
        );
      },
    );

    // test('it should update an intermediate item when we call updateIntermediateItem', () {
    //   when(mockIntermediateItemsRepo.updateIntermediateItem('intermediateItemName', 1, 1)).thenReturn(null);
    //   intermediateItemsRepo.updateIntermediateItem('intermediateItemName', 1, 1);
    //   verify(mockIntermediateItemsRepo.updateIntermediateItem('intermediateItemName', 1, 1));
    // });

    test(
      'it should update an intermediate item when we call updateIntermediateItem',
      () {
        intermediateItemsRepo.updateIntermediateItem(
          'intermediateItemName',
          1,
          1,
        );
        verify(
          mockIntermediateItemsRepo.updateIntermediateItem(
            'intermediateItemName',
            1,
            1,
          ),
        ).called(1);
      },
    );
  });
}
