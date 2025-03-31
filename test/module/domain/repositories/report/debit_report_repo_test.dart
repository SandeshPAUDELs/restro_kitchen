
import 'package:hive_project/module/domain/repositories/report/debit_report_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../repositories_test.mocks.dart';

void main(){
    late DebitReportRepo debitReportRepo;
    late MockDebitReportRepo mockDebitReportRepo;

    group('', (){
      setUp((){
        mockDebitReportRepo = MockDebitReportRepo();
        debitReportRepo = mockDebitReportRepo;
      });

      test('it should return the list of debit report items when we call getDebitReportItems', () {
        when(mockDebitReportRepo.getDebitReportItems()).thenAnswer((_) => []);
        final result = debitReportRepo.getDebitReportItems();
        expect(result, []);
      });

      test('it should add a debit report item when we call addDebitReportItems', () async {
        when(mockDebitReportRepo.addDebitReportItems(' ',   1)).thenAnswer((_) async {});
        await debitReportRepo.addDebitReportItems(' ',   1);
        verify(mockDebitReportRepo.addDebitReportItems(' ',   1)).called(1);
      });

    });
    

}