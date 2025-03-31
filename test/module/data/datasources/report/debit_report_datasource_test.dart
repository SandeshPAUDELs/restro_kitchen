import 'package:hive_project/module/data/datasources/report/debit_report_data_source.dart';
import 'package:hive_project/module/data/models/report/debit_models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../datasources_test.mocks.dart';

void main(){
  late DebitReportDataSourceImpl debitReportDataSourceImpl;
  late MockBox<DebitModels> box;

  group('Debit Report Data Source Test', () {
    setUp(() {
      box = MockBox<DebitModels>();
      debitReportDataSourceImpl = DebitReportDataSourceImpl(debitReportBox: box);
    });

    test('should display the data available in box', () {
      when(box.values).thenReturn([
        DebitModels(foodName: 'name', servingQuantity: 1)
      ]);
      final result = debitReportDataSourceImpl.getDebitReportItems();
      expect(result, contains(DebitModels(foodName: 'name', servingQuantity: 1)));
    });

    test('should add the debit report item in the box', () async {
      when(box.add(any)).thenAnswer((_) async => 0);
      await debitReportDataSourceImpl.addDebitReportItems('cg', 1);
      verify(box.add(DebitModels(foodName: 'cg', servingQuantity: 1)));
    });
    

  });
}