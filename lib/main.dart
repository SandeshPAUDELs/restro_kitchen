import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/module/data/datasources/ingredients_data_source.dart';
import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';
import 'package:hive_project/module/data/models/ingredients_items/ingredients_item_models.dart';
import 'package:hive_project/module/data/repositories/ingredients_repo_impl.dart';
import 'package:hive_project/module/domain/usecases/ingredients_usecases.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/screens/main_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(IngredientModelsAdapter());
  Hive.registerAdapter(IngredientsItemModelsAdapter());

  await Hive.openBox<IngredientModels>('ingredientBox');
  await Hive.openBox<IngredientsItemModels>('ingredientItemBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final IngredientsDataSource ingredientsDataSource = IngredientsDataSourceImpl(
      ingredientBox: Hive.box<IngredientModels>('ingredientBox'),
    );
    final IngredientsRepoImpl  repo = IngredientsRepoImpl(dataSource: ingredientsDataSource);
    final IngredientsUsecases ingredientsUsecases = IngredientsUsecases(repo);
    

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IngredientsBloc(ingredientsUsecases),

        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
