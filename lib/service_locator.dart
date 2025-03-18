import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/module/data/datasources/ingredients_data_source.dart';
import 'package:hive_project/module/data/datasources/ingredients_items_data_source.dart';
import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';
import 'package:hive_project/module/data/models/ingredients_items/ingredients_item_models.dart';
import 'package:hive_project/module/data/repositories/ingredients_items_repo_impl.dart';
import 'package:hive_project/module/data/repositories/ingredients_repo_impl.dart';
import 'package:hive_project/module/domain/repositories/ingredients_repo.dart';
import 'package:hive_project/module/domain/repositories/ingredients_items_repo.dart';
import 'package:hive_project/module/domain/usecases/ingredients_items_usecases.dart';
import 'package:hive_project/module/domain/usecases/ingredients_usecases.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';

final getIt = GetIt.instance;

Future<void> injection() async {
  // hives intiliazation
  await Hive.initFlutter();
  Hive.registerAdapter(IngredientModelsAdapter());
  Hive.registerAdapter(IngredientsItemModelsAdapter());

  // boxes
  await Hive.openBox<IngredientModels>('ingredientBox');
  await Hive.openBox<IngredientsItemModels>('ingredientItemBox');
  // datasources
  getIt.registerLazySingleton<IngredientsDataSource>(
    () => IngredientsDataSourceImpl(
      ingredientBox: Hive.box<IngredientModels>('ingredientBox'),
    ),
  );
  getIt.registerLazySingleton<IngredientsItemsDataSource>(
    () => IngredientsItemsDataSourceImpl(
      ingredientItemsBox: Hive.box<IngredientsItemModels>('ingredientItemBox'),
    ),
  );
  // repos
  getIt.registerLazySingleton<IngredientsRepo>(
    () => IngredientsRepoImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<IngredientsItemsRepo>(
    () => IngredientsItemsRepoImpl(dataSource: getIt()),
  );
  // usexase
  getIt.registerLazySingleton(() => IngredientsUsecases(getIt()));
  getIt.registerLazySingleton(() => IngredientsItemsUsecases(getIt()));

  // blocs
  getIt.registerFactory(() => IngredientsBloc(getIt()));
  getIt.registerFactory(() => IngredientsItemsBloc(getIt()));
}
