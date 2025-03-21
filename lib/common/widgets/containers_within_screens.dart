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

  static Container creatingheadingThreeColumns(
    BuildContext context,
    String heading1,
    String heading2,
    String heading3,
    Color color,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: color,
      padding: EdgeInsets.all(CommonStyle.screenpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.11,
            child: Text(heading1, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.11,
            child: Text(heading2, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.12,
            child: Text(heading3, maxLines: 2, style: textTheme.titleSmall),
          ),
        ],
      ),
    );
  }

  static Container createTableBodyThreeColumns(
    BuildContext context,
    String items,
    String items2,
    String items3,
    Widget child,
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
            width: width * 0.11,
            child: Text(items, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.11,
            child: Text(items2, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(width: width * 0.12, child: child),
        ],
      ),
    );
  }

  static Container createheadingforMarket(
    BuildContext context,
    String heading1,
    String heading2,
    String heaing3,
    // String heading4,
    Widget child,
    Color color,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: color,
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
          SizedBox(width: width * 0.1, child: child),
        ],
      ),
    );
  }

  static Container createHeadingforIntermediateItems(
    BuildContext context,
    String items1,
    String item2,
    String items3,
    String item4,
    Widget child,
    Widget child2,
    Color color,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: color,

      padding: EdgeInsets.all(CommonStyle.screenpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.13,
            child: Text(items1, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.13,
            child: Text(item2, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.13,
            child: Text(items3, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(
            width: width * 0.13,
            child: Text(item4, maxLines: 2, style: textTheme.titleSmall),
          ),
          SizedBox(width: width * 0.15, child: child),
          SizedBox(width: width * 0.14, child: child2),
        ],
      ),
    );
  }
}
