import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/domain/entities/ingredients_items/ingredient_items_entity.dart';
import 'package:hive_project/module/domain/usecases/ingredients_items_usecases.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_state.dart';

class IngredientsItemsBloc
    extends Bloc<IngredientsItemsEvents, IngredientsItemsState> {
  IngredientsItemsUsecases ingredientsItemsUsecases;
  IngredientsItemsBloc(this.ingredientsItemsUsecases)
    : super(IngredientsItemsInitialState()) {
    on<LoadIngredientsItemsEvents>((event, emit) async {
      emit(IngredientsItemsLoadingState());
      final ingredientItems = ingredientsItemsUsecases.getIngredientsItems();
      emit(IngredientsItemsLoadedState(ingredientItems: ingredientItems));
    });
    on<AddIngredientsItemsEvents>((event, emit) async {
      await ingredientsItemsUsecases.addIngredientItems(
        event.ingredientname,
        event.ingredientModels,
        event.price,
        event.materialsUnit,
      );
      final ingredientItems = ingredientsItemsUsecases.getIngredientsItems();
      emit(IngredientsItemsLoadedState(ingredientItems: ingredientItems));
    });
    on<LoadIngredientItemsByIngredientEvent>((event, emit) async {
      emit(IngredientsItemsLoadingState());
      final filteredItems = ingredientsItemsUsecases.getIngredientsItems()
          .where((item) => item.ingredientModels == event.ingredientKey)
          .toList();
      emit(IngredientsItemsLoadedState(ingredientItems: filteredItems));
    });
// increment price by click     
  on<IncrementMaterialsUnitEvent>((event, emit) async {
  final currentState = state;
  if (currentState is IngredientsItemsLoadedState) {
    final updatedItems = currentState.ingredientItems.map((item) {
      if (item.ingredientname == event.ingredientName) {
        final newMaterialsUnit = item.materialsUnit + 1;
        final newPrice = (item.price / item.materialsUnit) * newMaterialsUnit;
        
        ingredientsItemsUsecases.updateIngredientItem(item.ingredientname, newMaterialsUnit, newPrice);

        return IngredientItemsEntity(
          ingredientname: item.ingredientname,
          ingredientModels: item.ingredientModels,
          price: newPrice,
          materialsUnit: newMaterialsUnit,
        );
      }
      return item;
    }).toList();

    emit(IngredientsItemsLoadedState(ingredientItems: updatedItems));
  }
});
// decrease price by decrement press

on<DecrementMaterialsUnitEvent>((event, emit) async {
  final currentState = state;
  if (currentState is IngredientsItemsLoadedState) {
    final updatedItems = currentState.ingredientItems.map((item) {
      if (item.ingredientname == event.ingredientName && item.materialsUnit > 1) {
        final newMaterialsUnit = item.materialsUnit - 1;
        final newPrice = (item.price / item.materialsUnit) * newMaterialsUnit;
        
        ingredientsItemsUsecases.updateIngredientItem(item.ingredientname, newMaterialsUnit, newPrice);

        return IngredientItemsEntity(
          ingredientname: item.ingredientname,
          ingredientModels: item.ingredientModels,
          price: newPrice,
          materialsUnit: newMaterialsUnit,
        );
      }
      return item;
    }).toList();

    emit(IngredientsItemsLoadedState(ingredientItems: updatedItems));
  }
});

  }
}
