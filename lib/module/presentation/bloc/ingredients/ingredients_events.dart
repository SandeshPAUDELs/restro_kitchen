import 'package:equatable/equatable.dart';

abstract class IngredientsEvents extends Equatable{
  const IngredientsEvents();
  @override
  List<Object> get props => [];
}

class LoadIngredientsEvents extends IngredientsEvents {}
class AddIngredientsEvents extends IngredientsEvents {
  final String name;
  const AddIngredientsEvents({required this.name});
  @override
  List<Object> get props => [name];
}