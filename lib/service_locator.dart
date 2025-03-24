import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/module/data/datasources/food_prep_data_source.dart';
import 'package:hive_project/module/data/datasources/ingredients_data_source.dart';
import 'package:hive_project/module/data/datasources/ingredients_items_data_source.dart';
import 'package:hive_project/module/data/datasources/intermediate_items_data_source.dart';
import 'package:hive_project/module/data/datasources/report/credit_report_data_source.dart';
import 'package:hive_project/module/data/datasources/report/debit_report_data_source.dart';
import 'package:hive_project/module/data/models/Report/debit_report_models.dart';
import 'package:hive_project/module/data/models/food/food_models.dart';
import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';
import 'package:hive_project/module/data/models/ingredients_items/ingredients_item_models.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';
import 'package:hive_project/module/data/models/report/credit_models.dart';
import 'package:hive_project/module/data/repositories/food_prep_repo_impl.dart';
import 'package:hive_project/module/data/repositories/ingredients_items_repo_impl.dart';
import 'package:hive_project/module/data/repositories/ingredients_repo_impl.dart';
import 'package:hive_project/module/data/repositories/intermediate_items_repo_impl.dart';
import 'package:hive_project/module/data/repositories/report/credit_report_repo_impl.dart';
import 'package:hive_project/module/data/repositories/report/debit_report_repo_impl.dart';
import 'package:hive_project/module/domain/repositories/food_prep_repo.dart';
import 'package:hive_project/module/domain/repositories/ingredients_repo.dart';
import 'package:hive_project/module/domain/repositories/ingredients_items_repo.dart';
import 'package:hive_project/module/domain/repositories/intermediate_items_repo.dart';
import 'package:hive_project/module/domain/repositories/report/credit_report_repo.dart';
import 'package:hive_project/module/domain/repositories/report/debit_report_repo.dart';
import 'package:hive_project/module/domain/usecases/food_prep_usecases.dart';
import 'package:hive_project/module/domain/usecases/ingredients_items_usecases.dart';
import 'package:hive_project/module/domain/usecases/ingredients_usecases.dart';
import 'package:hive_project/module/domain/usecases/intermediate_items_usecases.dart';
import 'package:hive_project/module/domain/usecases/report/credit_report_usecases.dart';
import 'package:hive_project/module/domain/usecases/report/debit_report_usecases.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_bloc.dart';

final getIt = GetIt.instance;

Future<void> injection() async {
  // hives intiliazation
  await Hive.initFlutter();
  Hive.registerAdapter(IngredientModelsAdapter());
  Hive.registerAdapter(IngredientsItemModelsAdapter());
  Hive.registerAdapter(IntermediateItemsModelsAdapter());
  Hive.registerAdapter(OtherRequiredFoodModelsAdapter());
  Hive.registerAdapter(FoodModelsAdapter());
  Hive.registerAdapter(DebitReportModelsAdapter());
  Hive.registerAdapter(CreditModelsAdapter());


  // boxes
  await Hive.openBox<IngredientModels>('ingredientBox');
  await Hive.openBox<IngredientsItemModels>('ingredientItemBox');
  await Hive.openBox<IntermediateItemsModels>('intermediateItemsBox');
  await Hive.openBox<OtherRequiredFoodModels>('otherRequiredFoodBox');
  await Hive.openBox<FoodModels>('foodBox');
  await Hive.openBox<DebitReportModels>('debitReportBox');
  await Hive.openBox<CreditModels>('creditReportBox');



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
  getIt.registerLazySingleton<IntermediateItemsDataSource>(
    () => IntermediateItemsDataSourceImpl(
      intermediateItemsBox: Hive.box<IntermediateItemsModels>('intermediateItemsBox'),
    ),
  );
  getIt.registerLazySingleton<FoodPrepDataSource>(() => FoodPrepDataSourceImpl(
    foodBox: Hive.box<FoodModels>('foodBox'),
    otherRequiredFoodBox: Hive.box<OtherRequiredFoodModels>('otherRequiredFoodBox'),
  ));
  getIt.registerLazySingleton<CreditReportDataSource>(
    () => CreditReportDataSourceImpl(
      creditReportBox: Hive.box<CreditModels>('creditReportBox'),
    ),
  );
  getIt.registerLazySingleton<DebitReportDataSource>(
    () => DebitReportDataSourceImpl(
      debitReportBox: Hive.box<DebitReportModels>('debitReportBox'),
    ),
  );
  
  
  // repos
  getIt.registerLazySingleton<IngredientsRepo>(
    () => IngredientsRepoImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<IngredientsItemsRepo>(
    () => IngredientsItemsRepoImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<IntermediateItemsRepo>(
    () => IntermediateItemsRepoImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<FoodPrepRepo>(() => FoodPrepRepoImpl(dataSource: getIt()));
  getIt.registerLazySingleton<CreditReportRepo>(
    () => CreditReportRepoImpl(creditReportDataSource: getIt()),
  );
  getIt.registerLazySingleton<DebitReportRepo>(
    () => DebitReportRepoImpl(debitReportDataSource: getIt()),
  );
  // usexase
  getIt.registerLazySingleton(() => IngredientsUsecases(getIt()));
  getIt.registerLazySingleton(() => IngredientsItemsUsecases(getIt()));
  getIt.registerLazySingleton(() => IntermediateItemsUsecases(getIt()));
  getIt.registerLazySingleton(() => FoodPrepUsecases(getIt()));
  getIt.registerLazySingleton(() => CreditReportUsecases(getIt()));
  getIt.registerLazySingleton(() => DebitReportUsecases(getIt()));

  // blocs
  getIt.registerFactory(() => IngredientsBloc(getIt()));
  getIt.registerFactory(() => IngredientsItemsBloc(getIt()));
  getIt.registerFactory(() => IntermediateItemsBloc(getIt()));
  getIt.registerFactory(() => FoodPrepBloc(getIt()));
  getIt.registerFactory(() => CreditReportBloc(getIt()));
  getIt.registerFactory(() => DebitReportBloc(getIt()));
}
