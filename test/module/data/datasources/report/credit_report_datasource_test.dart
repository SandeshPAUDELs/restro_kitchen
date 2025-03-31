import 'package:hive_project/module/data/datasources/report/credit_report_data_source.dart';
import 'package:hive_project/module/data/models/report/credit_models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../datasources_test.mocks.dart';

void main() {
  late CreditReportDataSourceImpl creditReportDataSourceImpl;
  late MockBox<CreditModels> box;

  group('Credit Report Data Source Test', () {
    setUp(() {
      box = MockBox<CreditModels>();
      creditReportDataSourceImpl = CreditReportDataSourceImpl(creditReportBox: box);
    });

    test('should display the data available in box', () {
      when(box.values).thenReturn([
        CreditModels(ingredient: 'ingredient', price: 1000, materialUnit: 1)
      ]);
      final result = creditReportDataSourceImpl.getCreditReportItems();
      expect(result, contains(CreditModels(ingredient: 'ingredient', price: 1000, materialUnit: 1)));
    });

    test('should add the credit report item in the box', () async {
      when(box.values).thenReturn([]); 
      when(box.add(any)).thenAnswer((_) async => 0);
      await creditReportDataSourceImpl.addCreditReportItems('ingredient', 1000, 1);
      verify(box.add(CreditModels(ingredient: 'ingredient', price: 1000, materialUnit: 1)));
    });
    

    test('should update the credit report item if it already exists', () async {
      final existingItem = CreditModels(ingredient: 'ingredient', price: 1000, materialUnit: 1);
      when(box.values).thenReturn([existingItem]);
      when(box.getAt(0)).thenReturn(existingItem);
      when(box.putAt(0, any)).thenAnswer((_) async => {});

      await creditReportDataSourceImpl.addCreditReportItems('ingredient', 1000, 2);

      verify(box.putAt(
        0,
        CreditModels(ingredient: 'ingredient', price: 1000, materialUnit: 3),
      ));
    });

    test('should add a new credit report item if it does not exist', () async {
      when(box.values).thenReturn([]);
      when(box.add(any)).thenAnswer((_) async => 0);

      await creditReportDataSourceImpl.addCreditReportItems('newIngredient', 500, 2);

      verify(box.add(CreditModels(ingredient: 'newIngredient', price: 500, materialUnit: 2)));
    });

  });
}