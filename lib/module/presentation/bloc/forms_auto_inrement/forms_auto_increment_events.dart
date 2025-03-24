import 'package:equatable/equatable.dart';

abstract class FormsEvents extends Equatable {
  const FormsEvents();

  @override
  List<Object> get props => [];
}
class AddnewFormEvent extends FormsEvents {}

class UpdateAdditionalFormEvent extends FormsEvents {
  final int index;
  final String itemName;
  final double quantity;

  const UpdateAdditionalFormEvent({
    required this.index,
    required this.itemName,
    required this.quantity,
  });
  @override
  List<Object> get props => [index, itemName, quantity];
}

