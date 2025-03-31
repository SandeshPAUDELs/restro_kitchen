import 'package:bloc_test/bloc_test.dart';
import 'package:hive_project/module/domain/entities/ingredients_items/ingredient_items_entity.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_state.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_events.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../domain/usecases/usecases_test.mocks.dart';

void main() {
  late MockIngredientsItemsUsecases mockIngredientsItemsUsecases;
  late IngredientsItemsBloc ingredientsItemsBloc;

  group('Ingredients Items Bloc Test', () {
    setUp(() {
      mockIngredientsItemsUsecases = MockIngredientsItemsUsecases();
      ingredientsItemsBloc = IngredientsItemsBloc(mockIngredientsItemsUsecases);
    });

    test('Initial state should be IngredientsItemsInitialState', () {
      expect(ingredientsItemsBloc.state, IngredientsItemsInitialState());
    });

    blocTest<IngredientsItemsBloc, IngredientsItemsState>(
      'emits [IngredientsItemsLoadingState, IngredientsItemsLoadedState] when LoadIngredientsItemsEvents is added',
      build: () {
        when(mockIngredientsItemsUsecases.getIngredientsItems()).thenReturn([]);
        return ingredientsItemsBloc;
      },
      act: (bloc) => bloc.add(LoadIngredientsItemsEvents()),
      expect: () {
        return [
          IngredientsItemsLoadingState(),
          IngredientsItemsLoadedState(ingredientItems: []),
        ];
      },
    );

    blocTest<IngredientsItemsBloc, IngredientsItemsState>(
      'emits [IngredientsItemsLoadingState] when LoadIngredientsItemsEvents is added',
      build: () {
        when(mockIngredientsItemsUsecases.getIngredientsItems()).thenReturn([]);
        return ingredientsItemsBloc;
      },
      act: (bloc) => bloc.add(LoadIngredientsItemsEvents()),
      expect: () {
        return [
          IngredientsItemsLoadingState(),
          IngredientsItemsLoadedState(ingredientItems: []),
        ];
      },
    );
    blocTest<IngredientsItemsBloc, IngredientsItemsState>(
      'increment the price by quantity',
      build: () {
        final items = [
          IngredientItemsEntity(
            ingredientname: 'name',
            ingredientModels: 1,
            price: 77.0,
            materialsUnit: 1,
          ),
        ];
        when(
          mockIngredientsItemsUsecases.getIngredientsItems(),
        ).thenReturn(items);
        when(
          mockIngredientsItemsUsecases.updateIngredientItem(any, any, any),
        ).thenAnswer((_) async => {});
        return ingredientsItemsBloc;
      },
      seed:
          () => IngredientsItemsLoadedState(
            ingredientItems: [
              IngredientItemsEntity(
                ingredientname: 'name',
                ingredientModels: 1,
                price: 77.0,
                materialsUnit: 1,
              ),
            ],
          ),
      act:
          (bloc) =>
              bloc.add(IncrementMaterialsUnitEvent(ingredientName: 'name')),
      expect: () {
        final updatedPrice = 77.0;
        return [
          IngredientsItemsLoadedState(
            ingredientItems: [
              IngredientItemsEntity(
                ingredientname: 'name',
                ingredientModels: 1,
                price: updatedPrice * 2,
                materialsUnit: 2,
              ),
            ],
          ),
        ];
      },
    );

    blocTest<IngredientsItemsBloc, IngredientsItemsState>(
      'decrement the price by quantity',
      build: () {
        final items = [
          IngredientItemsEntity(
            ingredientname: 'name',
            ingredientModels: 1,
            price: 100.0,
            materialsUnit: 2,
          ),
        ];

        when(
          mockIngredientsItemsUsecases.getIngredientsItems(),
        ).thenReturn(items);
        when(
          mockIngredientsItemsUsecases.updateIngredientItem(any, any, any),
        ).thenAnswer((_) async => {});
        return ingredientsItemsBloc;
      },
      seed:
          () => IngredientsItemsLoadedState(
            ingredientItems: [
              IngredientItemsEntity(
                ingredientname: 'name',
                ingredientModels: 1,
                price: 100.0,
                materialsUnit: 2,
              ),
            ],
          ),
      act:
          (bloc) =>
              bloc.add(DecrementMaterialsUnitEvent(ingredientName: 'name')),
      expect: () {
        final updatedMaterialsUnit = 1;
        final unitPrice = 100.0 / 2;
        final updatedPrice = unitPrice * updatedMaterialsUnit;

        return [
          IngredientsItemsLoadedState(
            ingredientItems: [
              IngredientItemsEntity(
                ingredientname: 'name',
                ingredientModels: 1,
                price: updatedPrice,
                materialsUnit: updatedMaterialsUnit,
              ),
            ],
          ),
        ];
      },
    );
  });
}
