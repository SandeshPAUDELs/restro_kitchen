import 'package:hive_project/module/data/repositories/report/debit_report_repo_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../datasources/datasources_test.mocks.dart';

void main() {
  late MockDebitReportDataSource mockDebitReportDataSource;
  late DebitReportRepoImpl debitReportRepoImpl;

  group('Debit Report Repo Implementation Test', () {
    setUp(() {
      mockDebitReportDataSource = MockDebitReportDataSource();
      debitReportRepoImpl = DebitReportRepoImpl(debitReportDataSource: mockDebitReportDataSource);
    });

    test('should display the data available in box', () {
      when(mockDebitReportDataSource.getDebitReportItems()).thenReturn([]);
      final result = debitReportRepoImpl.getDebitReportItems();
      expect(result, []);
    });

    test('should add the debit report item in the box', () async {
      when(mockDebitReportDataSource.addDebitReportItems('cg', 1)).thenAnswer((_) async => {});
      await debitReportRepoImpl.addDebitReportItems('cg', 1);
      verify(mockDebitReportDataSource.addDebitReportItems('cg', 1));
    });
  });
}