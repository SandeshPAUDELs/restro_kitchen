import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/domain/usecases/report/debit_report_usecases.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_events.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_state.dart';

class DebitReportBloc extends Bloc<DebitReportEvents, DebitReportState> {
    final DebitReportUsecases debitReportUsecases;
    DebitReportBloc(this.debitReportUsecases)
        : super(DebitReportInitialState()) {
        on<LoadDebitReporrtEvents>((event, emit) async {
            emit(DebitReportLoadingState());
            final debitReport = debitReportUsecases.getDebitReportItems();
            emit(DebitReportLoadedState(debitReportItems: debitReport));
        });

        on<AddDebitReportEvents>((event, emit) async {
            await debitReportUsecases.addDebitReportItems(
                event.foodName,
                event.servingQuantity,
            );
            final debitReport = debitReportUsecases.getDebitReportItems();
            emit(DebitReportLoadedState(debitReportItems: debitReport));
        });
    }
}

