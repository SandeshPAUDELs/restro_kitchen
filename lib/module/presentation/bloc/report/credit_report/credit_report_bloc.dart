import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/domain/usecases/report/credit_report_usecases.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_events.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_state.dart';

class CreditReportBloc extends Bloc<CreditReportEvents, CreditReportState>{
  final CreditReportUsecases creditReportUsecases;
  CreditReportBloc(this.creditReportUsecases)
    : super(CreditReportInitialState()) {
    on<LoadCreditReportEvents>((event, emit) async {
      emit(CreditReportLoadingState());
      final creditReport = creditReportUsecases.getCreditReportItems();
      emit(CreditReportLoadedState(creditReportItems: creditReport));
    });

    on<AddCreditReportEvents>((event, emit) async {
      await creditReportUsecases.addCreditReportItems(
        event.ingredient,
        event.price,
        event.materialUnit,
      );
      final creditReport = creditReportUsecases.getCreditReportItems();
      emit(CreditReportLoadedState(creditReportItems: creditReport));
    });
  }
}