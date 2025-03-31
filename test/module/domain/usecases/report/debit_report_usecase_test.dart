import 'package:hive_project/module/domain/usecases/report/debit_report_usecases.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../repositories/repositories_test.mocks.dart';

void main(){
    late DebitReportUsecases debitReportUsecases;
    late MockDebitReportRepo mockDebitReportRepo;

    group('Debit Report Usecases Test', () {
      setUp(() {
        mockDebitReportRepo = MockDebitReportRepo();
        debitReportUsecases = DebitReportUsecases(mockDebitReportRepo);
      });

      test('it should return the list of debit report items when we call getDebitReportItems', () {
        when(mockDebitReportRepo.getDebitReportItems()).thenAnswer((_) => []);
        final result = debitReportUsecases.getDebitReportItems();
        expect(result, []);
      });

      test('it should add a debit report item when we call addDebitReportItems', () async {
        when(mockDebitReportRepo.addDebitReportItems(' ', 1)).thenAnswer((_) async {});
        await debitReportUsecases.addDebitReportItems(' ', 1);
        verify(mockDebitReportRepo.addDebitReportItems(' ', 1)).called(1);
      });
    });
}