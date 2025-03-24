import 'package:equatable/equatable.dart';

class DebitReportEvents extends Equatable{
  const DebitReportEvents();
  @override
  List<Object?> get props => [];
}
class LoadDebitReporrtEvents extends DebitReportEvents{}
class AddDebitReportEvents extends DebitReportEvents{
  final String foodName;
  final int servingQuantity;
  const AddDebitReportEvents({
    required this.foodName,
    required this.servingQuantity,
  });
  @override
  List<Object?> get props => [foodName, servingQuantity];
}