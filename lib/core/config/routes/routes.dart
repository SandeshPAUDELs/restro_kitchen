import 'package:flutter/material.dart';
import 'package:hive_project/core/config/routes/routes_name.dart';
import 'package:hive_project/module/presentation/screens/kitchen/food_prepared/prepared_food.dart';
import 'package:hive_project/module/presentation/screens/kitchen/intermediate_items/intermediate_items.dart';
import 'package:hive_project/module/presentation/screens/kitchen/preperation_process/food_prep_process.dart';
import 'package:hive_project/module/presentation/screens/main_screen.dart';
import 'package:hive_project/module/presentation/screens/market/market_screen.dart';
import 'package:hive_project/module/presentation/screens/seller_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.mainScreen:
        return MaterialPageRoute(builder: (content) => HomeScreen());
      case AppRoutesName.sellerScreen:
        return MaterialPageRoute(builder: (content) => SellerScreen());
      case AppRoutesName.marketScreen:
        return MaterialPageRoute(builder: (content) => MarketScreen());
      case AppRoutesName.intermediateItems:
        return MaterialPageRoute(builder: (content) => IntermediateItems());
      case AppRoutesName.preparedFood:
        return MaterialPageRoute(
          builder: (content) => PreparedFoodItemsScreen(),
        );
      case AppRoutesName.preperationProcess: 
        return MaterialPageRoute(
          builder: (content) => AddFoodScreen(),
        );

      
      default:
        return MaterialPageRoute(
          builder:
              (content) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
