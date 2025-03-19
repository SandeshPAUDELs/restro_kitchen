import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';

class ContainersWithinScreens {
  static ClipRRect createEmptyContainer(BuildContext context, Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.containerColor2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.actionBtnColor),
        ),
        child: child,
      ),
    );
  }

  static Container createheadinginSeller(
    BuildContext context,
    String heading1,
    String heading2,
    String heading3,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.containerColor,
      padding: EdgeInsets.all(CommonStyle.screenpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.12,
            child: Text(heading1, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.12,
            child: Text(heading2, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.15,
            child: Text(heading3, maxLines: 2, style: textTheme.titleSmall),
          ),
        ],
      ),
    );
  }

  static Container createTableBodyforSeller(
    BuildContext context,
    String items,
    String items2,
    String items3,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.surfaceColor,
      padding: EdgeInsets.all(CommonStyle.screenpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.12,
            child: Text(items, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.12,
            child: Text(items2, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.15,
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.minimize), onPressed: () {}),
                Text(items3, maxLines: 2, style: textTheme.titleSmall),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Container createheadingforMarket(
    BuildContext context,
    String heading1,
    String heading2,
    String heaing3,
    String heading4,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.containerColor,
      padding: EdgeInsets.all(CommonStyle.screenpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.1,
            child: Text(heading1, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(heading2, maxLines: 2, style: textTheme.bodyMedium),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(heaing3, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(heading4, maxLines: 2, style: textTheme.titleSmall),
          ),
        ],
      ),
    );
  }

  static Container createTableBodyforMarket(
    BuildContext context,
    String items,
    String items2,
    String items3,
    String items4,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.surfaceColor,
      padding: EdgeInsets.all(CommonStyle.screenpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.1,
            child: Text(items, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(items2, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.12,
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.minimize), onPressed: () {}),
                Text('1', style: textTheme.titleSmall),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
              ),
              onPressed: () {},
              child: Text(items4, style: textTheme.bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}
