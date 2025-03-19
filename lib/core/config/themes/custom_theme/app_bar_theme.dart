import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Builder,
        Icon,
        IconButton,
        Icons,
        MaterialPageRoute,
        Scaffold,
        Text,
        TextButton;
import 'package:flutter/widgets.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/presentation/screens/market/market_screen.dart';

class CustomeAppBarTheme {
  static AppBar appBarThemeforPages(BuildContext context, String titleText) {
    return AppBar(
      backgroundColor: AppColors.navColor,
      title: Text(
        titleText,
        style: TextThemes.createTextTheme(context).headlineSmall,
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }

  static AppBar appBarThemewithNavigation(
    BuildContext context,
    String titleText,
  ) {
    return AppBar(
      backgroundColor: AppColors.navColor,
      title: Text(
        titleText,
        style: TextThemes.createTextTheme(context).headlineSmall,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MarketScreen()),
            );
          },
          child: Text('Kitchen Section'),
        ),
      ],
    );
  }
}
