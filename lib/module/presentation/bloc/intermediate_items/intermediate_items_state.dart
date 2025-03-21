import 'package:equatable/equatable.dart';

abstract class IntermediateItemsState extends Equatable {
  const IntermediateItemsState();

  @override
  List<Object> get props => [];
}

class IntermediateItemsInitialState extends IntermediateItemsState {}
class IntermediateItemsLoadingState extends IntermediateItemsState {}
class IntermediateItemsLoadedState extends IntermediateItemsState {
  final List intermediateItems;
  const IntermediateItemsLoadedState({required this.intermediateItems});
  @override
  List<Object> get props => [intermediateItems];
}