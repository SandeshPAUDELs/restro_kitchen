import 'package:equatable/equatable.dart';

class DebitReportState extends Equatable{
  const DebitReportState();
  @override
  List<Object?> get props => [];
}

class DebitReportInitialState extends DebitReportState{}
class DebitReportLoadingState extends DebitReportState{}
class DebitReportLoadedState extends DebitReportState {
  final List debitReportItems;
  final String? message;
  const DebitReportLoadedState({required this.debitReportItems, this.message});
  @override
  List<Object?> get props => [debitReportItems, message ?? ''];
}