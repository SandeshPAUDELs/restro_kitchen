import 'package:hive_project/module/data/repositories/intermediate_items_repo_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../datasources/datasources_test.mocks.dart';

void main() {
  late MockIntermediateItemsDataSource mockIntermediateItemsDataSource;
  late IntermediateItemsRepoImpl intermediateItemsRepoImpl;

  group('Intermediate Items Repo Implementation Test', () {
    setUp(() {
      mockIntermediateItemsDataSource = MockIntermediateItemsDataSource();
      intermediateItemsRepoImpl = IntermediateItemsRepoImpl(
        dataSource: mockIntermediateItemsDataSource,
      );
    });

    test('should display the data available in box', () {
      when(
        mockIntermediateItemsDataSource.getIntermediateItems(),
      ).thenReturn([]);
      final result = intermediateItemsRepoImpl.getIntermediateItems();
      expect(result, []);
    });

    test('should add the intermediate items in the box', () async {
      when(
        mockIntermediateItemsDataSource.addIntermediateItem('name', 1, 1, 1, 1),
      ).thenAnswer((_) async => {});
      await intermediateItemsRepoImpl.addIntermediateItem('name', 1, 1, 1, 1);
      verify(
        mockIntermediateItemsDataSource.addIntermediateItem('name', 1, 1, 1, 1),
      );
    });
  });
}
