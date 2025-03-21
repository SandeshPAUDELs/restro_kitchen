import 'package:equatable/equatable.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';

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