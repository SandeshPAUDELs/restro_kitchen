import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_events.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_state.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/usecases/usecases_test.mocks.dart';

void main (){
  late CreditReportBloc creditReportBloc;
  late MockCreditReportUsecases mockCreditReportUsecases;

  group('Credit Report Bloc test', (){
    setUp((){
      mockCreditReportUsecases = MockCreditReportUsecases();
      creditReportBloc = CreditReportBloc(mockCreditReportUsecases);
    });

    test('Initial state should be CreditReportInitialState', (){
      expect(creditReportBloc.state, CreditReportInitialState());
    });

    blocTest<CreditReportBloc, CreditReportState>(
          'emits [CreditReportLoadingState, CreditReportLoadedState] when LoadCreditReportEvents is added',
          build: () {
            when(mockCreditReportUsecases.getCreditReportItems())
                .thenReturn([]);
            return creditReportBloc;
          },
          act: (bloc) => bloc.add(LoadCreditReportEvents()),
          expect: () => [
            CreditReportLoadingState(),
            CreditReportLoadedState(creditReportItems: []),
          ],
        );

        blocTest<CreditReportBloc, CreditReportState>(
          'emits [CreditReportLoadedState] after AddCreditReportEvents is added',
          build: () {
            when(mockCreditReportUsecases.addCreditReportItems(
                    'Ingredient', 100, 1))
                .thenAnswer((_) async {});
            when(mockCreditReportUsecases.getCreditReportItems())
                .thenReturn([]);
            return creditReportBloc;
          },
          act: (bloc) => bloc.add(AddCreditReportEvents(
            ingredient: 'Ingredient',
            price: 100,
            materialUnit: 1,)),
          expect: () => [
            CreditReportLoadedState(creditReportItems: []),
          ],
        );
      
  });
}