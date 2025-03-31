import 'package:bloc_test/bloc_test.dart';
import 'package:hive_project/module/presentation/bloc/food/food_item_state.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_events.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../domain/usecases/usecases_test.mocks.dart';

void main(){
  late FoodPrepBloc foodPrepBloc;
  late MockFoodPrepUsecases mockFoodPrepUsecases;

  group('food preperation bloc test', (){
    setUp((){
      mockFoodPrepUsecases = MockFoodPrepUsecases();
      foodPrepBloc = FoodPrepBloc(mockFoodPrepUsecases);
    });

    test('Initial state should be FoodPrepInitialState', (){
      expect(foodPrepBloc.state, FoodPrepInitial());
    });

    blocTest<FoodPrepBloc, FoodPrepState>(
      'emits [FoodPrepLoading, FoodPrepLoaded] when LoadFoodPrepItemsEvent is added',
      build: () {
      when(mockFoodPrepUsecases.getFoodPrepItems())
        .thenReturn([]);
      return foodPrepBloc;
      },
      act: (bloc) => bloc.add(LoadFoodPrepItemsEvent()),
      expect: () => [
      FoodPrepLoading(),
      FoodPrepLoaded([]),
      ],
    );

    blocTest<FoodPrepBloc, FoodPrepState>(
      'emits [FoodPrepLoading, FoodPrepError] when LoadFoodPrepItemsEvent fails',
      build: () {
      when(mockFoodPrepUsecases.getFoodPrepItems()).thenThrow(Exception());
      return foodPrepBloc;
      },
      act: (bloc) => bloc.add(LoadFoodPrepItemsEvent()),
      expect: () => [
      FoodPrepLoading(),
      FoodPrepError("Failed to load food prep items"),
      ],
    );

    blocTest<FoodPrepBloc, FoodPrepState>(
      'emits [FoodPrepLoaded] when AddFoodPrepItemEvent is added successfully',
      build: () {
      when(mockFoodPrepUsecases.addFoodPrepItems(
        any,
        any,
        any,
      )).thenAnswer((_) async => {});
      when(mockFoodPrepUsecases.getFoodPrepItems())
        .thenReturn([]);
      return foodPrepBloc;
      },
      act: (bloc) => bloc.add(AddFoodPrepItemEvent(
      foodName: 'NewItem',
      intermediateItemsModels: 0,
      otherItems: [],
      )),
      expect: () => [
      FoodPrepLoaded([]),
      ],
    );

  });
}