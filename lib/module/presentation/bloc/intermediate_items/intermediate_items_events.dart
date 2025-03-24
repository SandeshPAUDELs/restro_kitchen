import 'package:equatable/equatable.dart';
abstract class IntermediateItemsEvents extends Equatable {
  const IntermediateItemsEvents();

  @override
  List<Object> get props => [];

}
class LoadIntermediateItemsEvents extends IntermediateItemsEvents {}
class AddIntermediateItemsEvents extends IntermediateItemsEvents {
  final String intermediateItemName;
  final int ingredientsItemModels;
  final int availableQuantity;
  final int requiredQuantity;
  final int servingQuantity;
  const AddIntermediateItemsEvents( {
    required this.intermediateItemName,
    required this.ingredientsItemModels,
    required this.availableQuantity,
    required this.requiredQuantity,
    required this.servingQuantity,
  });
  @override
  List<Object> get props => [
    intermediateItemName,
    ingredientsItemModels,
    availableQuantity,
    requiredQuantity,
    servingQuantity,
  ];

}

class IncrementServingQuantityEvent extends IntermediateItemsEvents {
  final int index;

  const IncrementServingQuantityEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class DecrementServingQuantityEvent extends IntermediateItemsEvents {
  final int index;

  const DecrementServingQuantityEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class PrepareIntermediateItemEvent extends IntermediateItemsEvents {
  final int index;

  const PrepareIntermediateItemEvent({required this.index});

  @override
  List<Object> get props => [index];
}

