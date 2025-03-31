import 'package:hive_project/module/domain/usecases/report/credit_report_usecases.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../repositories/repositories_test.mocks.dart';

void main() {
  late CreditReportUsecases creditReportUseCase;
  late MockCreditReportRepo mockCreditReportRepo;

  group('credit report use caes test', (){
    setUp(() {
      mockCreditReportRepo = MockCreditReportRepo();
      creditReportUseCase = CreditReportUsecases(mockCreditReportRepo);
    });

    test('it should return the list of credit report items when we call getCreditReportItems', () {
      when(mockCreditReportRepo.getCreditReportItems()).thenAnswer((_) => []);
      final result = creditReportUseCase.getCreditReportItems();
      expect(result, []);
    });

    test('it should add a credit report item when we call addCreditReportItems', () async {
      when(mockCreditReportRepo.addCreditReportItems(' ', 1000, 1)).thenAnswer((_) async {});
      await creditReportUseCase.addCreditReportItems(' ', 1000, 1);
      verify(mockCreditReportRepo.addCreditReportItems(' ', 1000, 1)).called(1);
    });

  });
    

}