import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';
import 'package:hive_project/module/domain/entities/intermediate_items/intermediate_items_entity.dart';
import 'package:hive_project/module/domain/usecases/intermediate_items_usecases.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_events.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_state.dart';

class IntermediateItemsBloc
    extends Bloc<IntermediateItemsEvents, IntermediateItemsState> {
  IntermediateItemsUsecases intermediateItemsUsecases;
  IntermediateItemsBloc(this.intermediateItemsUsecases)
    : super(IntermediateItemsInitialState()) {
    // on<LoadIntermediateItemsEvents>((event, emit) async {
    //   emit(IntermediateItemsLoadingState());
    //   final intermediateItems =
    //       intermediateItemsUsecases.getIntermediateItems();
    //   emit(IntermediateItemsLoadedState(intermediateItems: intermediateItems));
    // });

    on<LoadIntermediateItemsEvents>((event, emit) {
      final box = Hive.box<IntermediateItemsModels>('intermediateItemsBox');

      final List<IntermediateItemsModels> allItems = box.values.toList();

      for (int i = 0; i < allItems.length; i++) {
        if (allItems[i].availableQuantity == 0) {
          final key = box.keyAt(i);
          box.delete(key); // Delete item if available quantity is 0
        }
      }

      final List<IntermediateItemsEntity> filteredItems =
          box.values
              .where((item) => item.availableQuantity > 0)
              .map(
                (item) => IntermediateItemsEntity(
                  intermediateItemName: item.intermediateItemName,
                  ingredientsItemModels: item.ingredientsItemModels,
                  availableQuantity: item.availableQuantity,
                  requiredQuantity: item.requiredQuantity,
                  servingQuantity: item.servingQuantity,
                ),
              )
              .toList();

      emit(IntermediateItemsLoadedState(intermediateItems: filteredItems));
    });

    on<AddIntermediateItemsEvents>((event, emit) async {
      await intermediateItemsUsecases.addIntermediateItem(
        event.intermediateItemName,
        event.ingredientsItemModels,
        event.availableQuantity,
        event.requiredQuantity,
        event.servingQuantity,
      );
      final intermediateItems =
          intermediateItemsUsecases.getIntermediateItems();
      emit(IntermediateItemsLoadedState(intermediateItems: intermediateItems));
    });
    on<IncrementServingQuantityEvent>((event, emit) {
      final currentState = state;
      if (currentState is IntermediateItemsLoadedState) {
        final updatedItems = List<IntermediateItemsEntity>.from(
          currentState.intermediateItems,
        );
        final item = updatedItems[event.index];

        if (item.availableQuantity >= item.requiredQuantity) {
          final newServingQuantity = item.servingQuantity + 1;
          final newRequiredQuantity =
              (item.requiredQuantity / item.servingQuantity) *
              newServingQuantity;

          updatedItems[event.index] = IntermediateItemsEntity(
            intermediateItemName: item.intermediateItemName,
            ingredientsItemModels: item.ingredientsItemModels,
            availableQuantity: item.availableQuantity,
            requiredQuantity: newRequiredQuantity.toInt(),
            servingQuantity: newServingQuantity,
          );

          intermediateItemsUsecases.updateIntermediateItem(
            item.intermediateItemName,
            newServingQuantity,
            newRequiredQuantity.toInt(),
          );

          emit(IntermediateItemsLoadedState(intermediateItems: updatedItems));
        }
      }
    });

    on<DecrementServingQuantityEvent>((event, emit) {
      final currentState = state;
      if (currentState is IntermediateItemsLoadedState) {
        final updatedItems = List<IntermediateItemsEntity>.from(
          currentState.intermediateItems,
        );
        final item = updatedItems[event.index];

        if (item.servingQuantity > 1) {
          final newServingQuantity = item.servingQuantity - 1;
          final newRequiredQuantity =
              (item.requiredQuantity / item.servingQuantity) *
              newServingQuantity;

          updatedItems[event.index] = IntermediateItemsEntity(
            intermediateItemName: item.intermediateItemName,
            ingredientsItemModels: item.ingredientsItemModels,
            availableQuantity: item.availableQuantity,
            requiredQuantity: newRequiredQuantity.toInt(),
            servingQuantity: newServingQuantity,
          );

          intermediateItemsUsecases.updateIntermediateItem(
            item.intermediateItemName,
            newServingQuantity,
            newRequiredQuantity.toInt(),
          );
          emit(IntermediateItemsLoadedState(intermediateItems: updatedItems));
        }
      }
    });
  }
}
