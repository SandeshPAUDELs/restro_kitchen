import 'package:equatable/equatable.dart';

class IngredientsState extends Equatable{
  const IngredientsState();
  @override
  List<Object> get props => [];

}

class IngredientsInitialState extends IngredientsState {}
class IngredientsLoadingState extends IngredientsState {}
class IngredientsLoadedState extends IngredientsState {
  final List ingredients;
  const IngredientsLoadedState({required this.ingredients});
  @override
  List<Object> get props => [ingredients];
}
