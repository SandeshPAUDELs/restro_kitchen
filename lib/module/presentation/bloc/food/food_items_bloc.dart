import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/domain/usecases/food_prep_usecases.dart';
import 'package:hive_project/module/presentation/bloc/food/food_item_state.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_events.dart';


class FoodPrepBloc extends Bloc<FoodPrepEvent, FoodPrepState> {
  final FoodPrepUsecases foodPrepUsecases;

  FoodPrepBloc(this.foodPrepUsecases) : super(FoodPrepInitial()) {
    on<LoadFoodPrepItemsEvent>((event, emit) {
      emit(FoodPrepLoading());
      try {
        final items = foodPrepUsecases.getFoodPrepItems();
        emit(FoodPrepLoaded(items));
      } catch (e) {
        emit(FoodPrepError("Failed to load food prep items"));
      }
    });

    on<AddFoodPrepItemEvent>((event, emit) async {
      try {
        await foodPrepUsecases.addFoodPrepItems(
          event.foodName,
          event.intermediateItemsModels,
          event.otherItems,
        );
        final items = foodPrepUsecases.getFoodPrepItems();
        emit(FoodPrepLoaded(items));
      } catch (e) {
        emit(FoodPrepError("Failed to add food prep item"));
      }
    });
  }
}
