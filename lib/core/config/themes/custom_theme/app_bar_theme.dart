import 'package:flutter/material.dart'
    show AppBar, BuildContext, Text, TextButton;
import 'package:flutter/widgets.dart';
import 'package:hive_project/core/config/routes/routes_name.dart';
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
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: AppColors.containerColor2),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutesName.marketScreen);
          },
          child: Text(
            'Kitchen Section',
            style: TextThemes.createTextTheme(context).bodyMedium,
          ),
        ),
      ],
    );
  }
}
