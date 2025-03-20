import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/core/config/routes/routes_name.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/screens/kitchen/food_prepared/prepared_food.dart';
import 'package:hive_project/module/presentation/screens/kitchen/intermediate_items/intermediate_items.dart';
import 'package:hive_project/module/presentation/screens/main_screen.dart';
import 'package:hive_project/module/presentation/screens/market/market_screen.dart';
import 'package:hive_project/module/presentation/screens/seller_screen.dart';
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
        title: 'Hive Project',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutesName.mainScreen,
        routes: {
          AppRoutesName.mainScreen: (context) => HomeScreen(),
          AppRoutesName.sellerScreen: (context) => SellerScreen(),
          AppRoutesName.marketScreen: (context) => MarketScreen(),
          AppRoutesName.intermediateItems: (context) => IntermediateItems(),
          AppRoutesName.preparedFood: (context) =>  PreparedFoodItemsScreen(),
        },
        onUnknownRoute:
            (settings) => MaterialPageRoute(
              builder:
                  (context) => const Scaffold(
                    body: Center(child: Text('Page not found')),
                  ),
            ),
      ),
    );
  }
}
