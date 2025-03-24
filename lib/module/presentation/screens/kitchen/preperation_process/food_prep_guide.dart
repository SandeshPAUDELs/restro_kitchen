import 'package:flutter/material.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/common/widgets/alertboxes/alert_dialogs.dart';
import 'package:hive_project/common/widgets/containers_within_screens.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/domain/entities/food/food_entities.dart';
import 'package:hive_project/module/presentation/widget/navigation_widget.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodEntities food;
  final String intermediateItemName;
  final double requiredQuantity;
  final int servingQuantity;

  const FoodDetailsScreen({
    Key? key,
    required this.food,
    required this.intermediateItemName,
    required this.requiredQuantity,
    required this.servingQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationWidget(),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              color: AppColors.containerColor,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: ContainersWithinScreens.createEmptyContainer(
                      context,
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: AppColors.containerColor3,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              food.foodName,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 3,
                            child: Container(
                              color: AppColors.containerColor2,

                              child: Column(
                                children: [
                                  ContainersWithinScreens.creatingheadingThreeColumns(
                                    context,
                                    'Materials used',
                                    'Price',
                                    'Quantity ',
                                    AppColors.containerColor,
                                  ),
                                  ...food.otherRequiredFoodEntities.map(
                                    (e) =>
                                        ContainersWithinScreens.creatingheadingThreeColumns(
                                          context,
                                          e.itemName,
                                          e.price.toString(),
                                          e.quantity.toString(),
                                          AppColors.surfaceColor,
                                        ),
                                  ),
                                  ContainersWithinScreens.creatingheadingThreeColumns(
                                    context,
                                    intermediateItemName,
                                    'Price',
                                    requiredQuantity.toString(),
                                    AppColors.surfaceColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        ContainersWithinScreens.createheadingforMarket(
                          context,
                          'Ingredient Name',
                          'IntermediateItems',
                          'Prepared Quantity',
                          Text('Serve', style: textTheme.titleSmall),
                          AppColors.containerColor,
                        ),

                        ContainersWithinScreens.createheadingforMarket(
                          context,
                          food.foodName,
                          intermediateItemName,
                          servingQuantity.toString(),
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
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child:
                                        AlertDialogsforScreens.createAlertDialogforSuccess(
                                          context,
                                          'Revenue Added successfully',
                                        ),
                                  );
                                },
                              );
                            },
                            child: Text('Serve', style: textTheme.bodyMedium),
                          ),

                          AppColors.surfaceColor,
                        ),
                      ],
                    ),
                  ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
