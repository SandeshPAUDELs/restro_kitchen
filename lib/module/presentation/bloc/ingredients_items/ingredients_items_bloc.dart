import 'package:flutter_bloc/flutter_bloc.dart';
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
  }
}
