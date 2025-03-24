import 'package:equatable/equatable.dart';
import 'package:hive_project/module/domain/entities/food/food_entities.dart';

abstract class FormsState extends Equatable {
  const FormsState();

  @override
  List<Object> get props => [];
}

class FormInitialState extends FormsState {}
class FormLoadingState extends FormsState {}
class FormLoadedState extends FormsState {
  final List<OtherRequiredFoodEntities> forms;
  const FormLoadedState(this.forms);
  @override
  List<Object> get props => [forms];
}