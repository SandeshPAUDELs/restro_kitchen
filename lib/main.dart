import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/screens/main_screen.dart';
import 'package:hive_project/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection();

  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IngredientsBloc(getIt())),
        BlocProvider(create: (context) => IngredientsItemsBloc(getIt())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
