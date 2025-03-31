import 'package:bloc_test/bloc_test.dart';
import 'package:hive_project/module/domain/entities/intermediate_items/intermediate_items_entity.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_events.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../domain/usecases/usecases_test.mocks.dart';

void main() {
  late IntermediateItemsBloc intermediateItemsBloc;
  late MockIntermediateItemsUsecases mockIntermediateItemsUsecases;

  group('Intermediate Items Bloc Test', () {
    setUp(() {
      mockIntermediateItemsUsecases = MockIntermediateItemsUsecases();
      intermediateItemsBloc = IntermediateItemsBloc(
        mockIntermediateItemsUsecases,
      );
    });

    test('Initial state should be IntermediateItemsInitial', () {
      expect(intermediateItemsBloc.state, IntermediateItemsInitialState());
    });
    blocTest<IntermediateItemsBloc, IntermediateItemsState>('get garne', build: (){
      when(mockIntermediateItemsUsecases.getIntermediateItems()).thenReturn([]);
      return intermediateItemsBloc;
    }, act: (bloc) => bloc.add(LoadIntermediateItemsEvents()), expect: () {
      return [
        IntermediateItemsLoadingState(),
        IntermediateItemsLoadedState(intermediateItems: []),
      ];
    },);


    // blocTest<IntermediateItemsBloc, IntermediateItemsState>(
    //   'emits [IntermediateItemsLoadedState] with filtered items when LoadIntermediateItemsEvents is added',
    //   build: () {
    //     final mockBox = MockBox<IntermediateItemsModels>();
    //     when(mockBox.values).thenReturn([
    //       IntermediateItemsModels(
    //         intermediateItemName: 'Item1',
    //         ingredientsItemModels: 1,
    //         availableQuantity: 5,
    //         requiredQuantity: 2,
    //         servingQuantity: 1,
    //       ),
    //       IntermediateItemsModels(
    //         intermediateItemName: 'Item2',
    //         ingredientsItemModels: 1,
    //         availableQuantity: 0,
    //         requiredQuantity: 1,
    //         servingQuantity: 1,
    //       ),
    //     ]);
    //     when(mockBox.keyAt(any)).thenReturn(1);
    //     when(mockBox.delete(any)).thenAnswer((_) async => {});
    //     when(Hive.openBox<IntermediateItemsModels>('intermediateItemsBox'))
    //         .thenAnswer((_) async => mockBox);
    //     when(Hive.box<IntermediateItemsModels>('intermediateItemsBox'))
    //         .thenReturn(mockBox);

    //     return intermediateItemsBloc;
    //   },
    //   act: (bloc) => bloc.add(LoadIntermediateItemsEvents()),
    //   expect: () => [
    //     IntermediateItemsLoadedState(
    //       intermediateItems: [
    //         IntermediateItemsEntity(
    //           intermediateItemName: 'Item1',
    //           ingredientsItemModels: 1,
    //           availableQuantity: 5,
    //           requiredQuantity: 2,
    //           servingQuantity: 1,
    //         ),
    //       ],
    //     ),
    //   ],
    //   verify: (_) {
    //     final mockBox = Hive.box<IntermediateItemsModels>('intermediateItemsBox');
    //     verify(mockBox.delete(1)).called(1);
    //   },
    // );

    blocTest<IntermediateItemsBloc, IntermediateItemsState>(
      'emits [IntermediateItemsLoadedState] with updated items when AddIntermediateItemsEvents is added',
      build: () {
        when(
          mockIntermediateItemsUsecases.addIntermediateItem(
            any,
            any,
            any,
            any,
            any,
          ),
        ).thenAnswer((_) async => {});
        when(mockIntermediateItemsUsecases.getIntermediateItems()).thenReturn([
          IntermediateItemsEntity(
            intermediateItemName: 'NewItem',
            ingredientsItemModels: 2,
            availableQuantity: 10,
            requiredQuantity: 5,
            servingQuantity: 1,
          ),
        ]);
        return intermediateItemsBloc;
      },
      act:
          (bloc) => bloc.add(
            AddIntermediateItemsEvents(
              intermediateItemName: 'NewItem',
              ingredientsItemModels: 2,
              availableQuantity: 10,
              requiredQuantity: 5,
              servingQuantity: 1,
            ),
          ),
      expect:
          () => [
            IntermediateItemsLoadedState(
              intermediateItems: [
                IntermediateItemsEntity(
                  intermediateItemName: 'NewItem',
                  ingredientsItemModels: 2,
                  availableQuantity: 10,
                  requiredQuantity: 5,
                  servingQuantity: 1,
                ),
              ],
            ),
          ],
      verify: (_) {
        verify(
          mockIntermediateItemsUsecases.addIntermediateItem(
            'NewItem',
            2,
            10,
            5,
            1,
          ),
        ).called(1);
        verify(mockIntermediateItemsUsecases.getIntermediateItems()).called(1);
      },
    );

    blocTest<IntermediateItemsBloc, IntermediateItemsState>(
      'emits [IntermediateItemsLoadedState] with updated serving quantity when IncrementServingQuantityEvent is added',
      build: () {
        when(
          mockIntermediateItemsUsecases.updateIntermediateItem(any, any, any),
        ).thenAnswer((_) async => {});
        return intermediateItemsBloc;
      },
      seed:
          () => IntermediateItemsLoadedState(
            intermediateItems: [
              IntermediateItemsEntity(
                intermediateItemName: 'Item1',
                ingredientsItemModels: 1,
                availableQuantity: 10,
                requiredQuantity: 2,
                servingQuantity: 1,
              ),
            ],
          ),
      act: (bloc) => bloc.add(IncrementServingQuantityEvent(index: 0)),
      expect:
          () => [
            IntermediateItemsLoadedState(
              intermediateItems: [
                IntermediateItemsEntity(
                  intermediateItemName: 'Item1',
                  ingredientsItemModels: 1,
                  availableQuantity: 10,
                  requiredQuantity: 4,
                  servingQuantity: 2,
                ),
              ],
            ),
          ],
      verify: (_) {
        verify(
          mockIntermediateItemsUsecases.updateIntermediateItem('Item1', 2, 4),
        ).called(1);
      },
    );

    blocTest<IntermediateItemsBloc, IntermediateItemsState>(
      'emits [IntermediateItemsLoadedState] with updated serving quantity when DecrementServingQuantityEvent is added',
      build: () {
        when(
          mockIntermediateItemsUsecases.updateIntermediateItem(any, any, any),
        ).thenAnswer((_) async => {});
        return intermediateItemsBloc;
      },
      seed:
          () => IntermediateItemsLoadedState(
            intermediateItems: [
              IntermediateItemsEntity(
                intermediateItemName: 'Item1',
                ingredientsItemModels: 1,
                availableQuantity: 10,
                requiredQuantity: 4,
                servingQuantity: 2,
              ),
            ],
          ),
      act: (bloc) => bloc.add(DecrementServingQuantityEvent(index: 0)),
      expect:
          () => [
            IntermediateItemsLoadedState(
              intermediateItems: [
                IntermediateItemsEntity(
                  intermediateItemName: 'Item1',
                  ingredientsItemModels: 1,
                  availableQuantity: 10,
                  requiredQuantity: 2,
                  servingQuantity: 1,
                ),
              ],
            ),
          ],
      verify: (_) {
        verify(
          mockIntermediateItemsUsecases.updateIntermediateItem('Item1', 1, 2),
        ).called(1);
      },
    );
  });
}
