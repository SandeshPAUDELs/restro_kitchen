import 'package:bloc/bloc.dart';
import 'package:hive_project/module/domain/usecases/ingredients_usecases.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_state.dart';

class IngredientsBloc extends Bloc<IngredientsEvents, IngredientsState>{
  IngredientsUsecases ingredientsUsecases;
  IngredientsBloc(this.ingredientsUsecases) : super(IngredientsInitialState()){
    on<LoadIngredientsEvents> ((event, emit) async {
      emit(IngredientsLoadingState());
      final ingredients = ingredientsUsecases.getIngredients();
      emit(IngredientsLoadedState(ingredients: ingredients));
    });
    on<AddIngredientsEvents> ((event, emit) async {
      await ingredientsUsecases.addIngredient(event.name);
      final ingredients = ingredientsUsecases.getIngredients();
      emit(IngredientsLoadedState(ingredients: ingredients));
    });
  }
}