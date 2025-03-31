import 'package:hive_project/module/data/repositories/report/credit_report_repo_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../datasources/datasources_test.mocks.dart';

void main (){
  late MockCreditReportDataSource mockCreditReportDataSource;
  late CreditReportRepoImpl creditReportRepoImpl;

  group('Credit Report Repo Implementation Test', (){
    setUp((){
      mockCreditReportDataSource = MockCreditReportDataSource();
      creditReportRepoImpl = CreditReportRepoImpl(creditReportDataSource: mockCreditReportDataSource);
    });

    test('should display the data available in box', (){
      when(mockCreditReportDataSource.getCreditReportItems()).thenReturn([]);
      final result = creditReportRepoImpl.getCreditReportItems();
      expect(result, []);
    });

    test('should add the credit report item in the box', () async {
      when(mockCreditReportDataSource.addCreditReportItems('cg', 1, 1)).thenAnswer((_) async => {});
      await creditReportRepoImpl.addCreditReportItems('cg', 1, 1);
      verify(mockCreditReportDataSource.addCreditReportItems('cg', 1, 1));
    });
  });
}