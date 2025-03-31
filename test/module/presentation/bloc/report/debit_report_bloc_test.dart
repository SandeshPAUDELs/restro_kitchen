import 'package:bloc_test/bloc_test.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_events.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../domain/usecases/usecases_test.mocks.dart';

void main() {
  late MockDebitReportUsecases mockDebitReportUsecases;

  late DebitReportBloc debitReportBloc;
  group('Debit Report Bloc test', () {
    setUp(() {
      mockDebitReportUsecases = MockDebitReportUsecases();
      debitReportBloc = DebitReportBloc(mockDebitReportUsecases);
    });

    test('Initial state should be DebitReportInitialState', () {
      expect(debitReportBloc.state, DebitReportInitialState());
    });

    blocTest<DebitReportBloc, DebitReportState>(
      'emits [DebitReportLoadingState, DebitReportLoadedState] when LoadDebitReportEvents is added',
      build: () {
        when(mockDebitReportUsecases.getDebitReportItems()).thenReturn([]);
        return debitReportBloc;
      },
      act: (bloc) => bloc.add(LoadDebitReporrtEvents()),
      expect:
          () => [
            DebitReportLoadingState(),
            DebitReportLoadedState(debitReportItems: []),
          ],
    );

    blocTest<DebitReportBloc, DebitReportState>(
      'emits [DebitReportLoadedState] after AddDebitReportEvents is added',
      build: () {
        when(
          mockDebitReportUsecases.addDebitReportItems('Ingredient', 1),
        ).thenAnswer((_) async {});
        when(mockDebitReportUsecases.getDebitReportItems()).thenReturn([]);
        return debitReportBloc;
      },
      act:
          (bloc) => bloc.add(
            AddDebitReportEvents(foodName: 'chapati', servingQuantity: 1),
          ),
      expect: () => [DebitReportLoadedState(debitReportItems: [])],
    );
  });
}
