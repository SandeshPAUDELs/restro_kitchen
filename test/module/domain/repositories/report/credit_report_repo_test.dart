import 'package:hive_project/module/domain/repositories/report/credit_report_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../repositories_test.mocks.dart';

void main(){
    late CreditReportRepo creditReportRepo;
    late MockCreditReportRepo mockCreditReportRepo;
    group('Credit Report Repo Test', (){
        setUp((){
            mockCreditReportRepo = MockCreditReportRepo();
            creditReportRepo = mockCreditReportRepo;
        });

        test('it should return the list of credit report items when we call getCreditReportItems', () {
            when(mockCreditReportRepo.getCreditReportItems()).thenAnswer((_) => []);
            final result = creditReportRepo.getCreditReportItems();
            expect(result, []);
        });

        test('it should add a credit report item when we call addCreditReportItems', () async {
            when(mockCreditReportRepo.addCreditReportItems(' ', 1000, 1)).thenAnswer((_) async {});
            await creditReportRepo.addCreditReportItems(' ', 1000, 1);
            verify(mockCreditReportRepo.addCreditReportItems(' ', 1000, 1)).called(1);
        });
    });
}