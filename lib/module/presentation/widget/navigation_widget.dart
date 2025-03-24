import 'package:flutter/material.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/core/config/routes/routes_name.dart';
import 'package:hive_project/core/config/themes/colors.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      {'title': 'Market Screen', 'route': AppRoutesName.marketScreen},
      {'title': 'Intermediate Items', 'route': AppRoutesName.intermediateItems},
      {'title': 'Prepared Food', 'route': AppRoutesName.preparedFood},
      {'title': 'Preperation Guide', 'route': AppRoutesName.preperationProcess},
      {'title': 'Report Screen', 'route': AppRoutesName.reportScreen},
    ];
    return Container(
      height: 40,
      color: AppColors.containerColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: screens.length,
        itemBuilder: (context, index) {
          final screen = screens[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CommonStyle.contanersPadding,
            ),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, screen['route']!),
              child: Chip(
                backgroundColor: AppColors.containerColor,
                label: Text(
                  screen['title']!,
                  style: TextStyle(color: AppColors.containerColor2),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
