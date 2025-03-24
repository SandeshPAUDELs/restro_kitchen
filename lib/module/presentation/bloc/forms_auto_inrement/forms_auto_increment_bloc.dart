import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/domain/entities/food/food_entities.dart';
import 'package:hive_project/module/presentation/bloc/forms_auto_inrement/forms_auto_increment_events.dart';
import 'package:hive_project/module/presentation/bloc/forms_auto_inrement/forms_auto_increment_state.dart';

class FormsBloc extends Bloc<FormsEvents, FormsState> {
  FormsBloc() : super(FormLoadedState([
    OtherRequiredFoodEntities(itemName: '', quantity: 0, price: 0),
  ])) {
    on<AddnewFormEvent>((event, emit) {
      if (state is FormLoadedState) {
        final current = (state as FormLoadedState).forms;
        final updated = List<OtherRequiredFoodEntities>.from(current)
          ..add(OtherRequiredFoodEntities(itemName: '', quantity: 0, price: 0));
        emit(FormLoadedState(updated));
      }
    });

    on<UpdateAdditionalFormEvent>((event, emit) {
      if (state is FormLoadedState) {
        final current = (state as FormLoadedState).forms;
        final updated = List<OtherRequiredFoodEntities>.from(current);
        updated[event.index] = OtherRequiredFoodEntities(
          itemName: event.itemName,
          quantity: event.quantity,
          price: event.price,
        );
        emit(FormLoadedState(updated));
      }
    });
  }
}
