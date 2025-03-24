import 'package:equatable/equatable.dart';

class CreditReportEvents extends Equatable {
  const CreditReportEvents();
  @override
  List<Object?> get props => [];
}

class LoadCreditReportEvents extends CreditReportEvents {}
class AddCreditReportEvents extends CreditReportEvents {
  final String ingredient;
  final double price;
  final double materialUnit;
  const AddCreditReportEvents({
    required this.ingredient,
    required this.price,
    required this.materialUnit,
  });
  @override
  List<Object?> get props => [ingredient, price, materialUnit];
}