import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/domain/usecases/intermediate_items_usecases.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_events.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_state.dart';

class IntermediateItemsBloc extends Bloc<IntermediateItemsEvents, IntermediateItemsState>{
  IntermediateItemsUsecases intermediateItemsUsecases;
  IntermediateItemsBloc(this.intermediateItemsUsecases)
    : super(IntermediateItemsInitialState()) {
    on<LoadIntermediateItemsEvents>((event, emit) async {
      emit(IntermediateItemsLoadingState());
      final intermediateItems = intermediateItemsUsecases.getIntermediateItems();
      emit(IntermediateItemsLoadedState(intermediateItems: intermediateItems));
    });
    on<AddIntermediateItemsEvents>((event, emit) async {
      await intermediateItemsUsecases.addIntermediateItem(
        event.intermediateItemName,
        event.ingredientsItemModels,
        event.availableQuantity,
        event.requiredQuantity,
        event.servingQuantity,
      );
      final intermediateItems = intermediateItemsUsecases.getIntermediateItems();
      emit(IntermediateItemsLoadedState(intermediateItems: intermediateItems));
    });
  }
}