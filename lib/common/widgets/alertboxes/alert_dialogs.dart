import 'package:flutter/material.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';

class AlertDialogsforScreens {
  static Container createAlertDialogWhenPrepareButtonPressed(
    BuildContext context,
    String itemName,
    double price,
    Widget child,
    String materials,
    int quantity,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.actionBtnColor,
      width: width * 0.92,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonStyle.largePadding,
          vertical: CommonStyle.contanersPadding,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(itemName, style: textTheme.titleSmall),
                Text('Rs$price/-', style: textTheme.titleSmall),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.minimize), onPressed: () {}),
                    Text('$quantity', style: textTheme.bodyMedium),
                    IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                  ),
                  onPressed: () {},
                  child: Text('prepare', style: textTheme.bodyMedium),
                ),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }

  static Container createAlertContainerForNoData(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(CommonStyle.contanersPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: AppColors.textColor),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextThemes.createTextTheme(
              context,
            ).headlineSmall!.copyWith(fontWeight: FontWeight.w600),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                vertical: CommonStyle.contanersPadding,
                horizontal: CommonStyle.contanersPadding,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static Container createAlertDialogforSuccess(
    BuildContext context,
    String text,
  ) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.4,
      height: MediaQuery.of(context).size.height * 0.4,

      color: AppColors.surfaceColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextThemes.createTextTheme(context).titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textinContainers,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                vertical: CommonStyle.contanersPadding,
                horizontal: CommonStyle.contanersPadding,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Ok',
              style: TextStyle(color: AppColors.textinContainers),
            ),
          ),
        ],
      ),
    );
  }
}
