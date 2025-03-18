import 'package:flutter/material.dart'
    show AppBar, BuildContext, Builder, Icon, IconButton, Icons, Scaffold, Text;
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';

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

  static AppBar appBarThemewithoutDrawer(
    BuildContext context,
    String titleText,
  ) {
    return AppBar(
      backgroundColor: AppColors.navColor,
      title: Text(
        titleText,
        style: TextThemes.createTextTheme(context).headlineSmall,
      ),
    );
  }
}
