import 'package:equatable/equatable.dart';

class CreditReportState extends Equatable{
  const CreditReportState();
  @override
  List<Object?> get props => [];
}

class CreditReportInitialState extends CreditReportState{}
class CreditReportLoadingState extends CreditReportState{}
class CreditReportLoadedState extends CreditReportState {
  final List creditReportItems;
  final String? message;
  const CreditReportLoadedState({required this.creditReportItems, this.message});
  @override
  List<Object?> get props => [creditReportItems, message ?? ''];
}