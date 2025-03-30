import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:hive_project/module/domain/entities/ingredients/ingredients_entity.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_state.dart';

import '../../domain/usecases/usecases_test.mocks.dart';

void main() {
  late IngredientsBloc ingredientsBloc;
  late MockIngredientsUsecases mockIngredientsUsecases;

  final ingredient = IngredientsEntity(name: 'name');

  setUp(() {
    mockIngredientsUsecases = MockIngredientsUsecases();
    ingredientsBloc = IngredientsBloc(mockIngredientsUsecases);
  });

  test('Initial state should be IngredientsInitialState', () {
    expect(ingredientsBloc.state, IngredientsInitialState());
  });

  blocTest<IngredientsBloc, IngredientsState>(
    'emits [IngredientsLoadingState, IngredientsLoadedState] when LoadIngredientsEvents is added',
    build: () {
      when(mockIngredientsUsecases.getIngredients()).thenReturn([ingredient]);
      return ingredientsBloc;
    },
    act: (bloc) => bloc.add(LoadIngredientsEvents()),
    expect:
        () => [
          IngredientsLoadingState(),
          IngredientsLoadedState(ingredients: [ingredient]),
        ],
  );

  blocTest<IngredientsBloc, IngredientsState>(
    'emits [IngredientsLoadedState] after AddIngredientsEvents is added',
    build: () {
      when(
        mockIngredientsUsecases.addIngredient('name'),
      ).thenAnswer((_) async {});
      when(mockIngredientsUsecases.getIngredients()).thenReturn([ingredient]);
      return ingredientsBloc;
    },
    act: (bloc) => bloc.add(AddIngredientsEvents(name: 'name')),
    expect:
        () => [
          IngredientsLoadedState(ingredients: [ingredient]),
        ],
  );
}
