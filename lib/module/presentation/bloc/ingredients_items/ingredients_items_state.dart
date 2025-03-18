import 'package:equatable/equatable.dart';

class IngredientsItemsState extends Equatable{
  const IngredientsItemsState();
  @override
  List<Object> get props => [];
}

class IngredientsItemsInitialState extends IngredientsItemsState {}
class IngredientsItemsLoadingState extends IngredientsItemsState {}
class IngredientsItemsLoadedState extends IngredientsItemsState {
  final List ingredientItems;
  const IngredientsItemsLoadedState({required this.ingredientItems});
  @override
  List<Object> get props => [ingredientItems];
}
