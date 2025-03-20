import 'package:flutter/material.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/common/widgets/containers_within_screens.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_field_theme.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/presentation/widget/navigation_widget.dart';

class IntermediateItems extends StatelessWidget {
  const IntermediateItems({super.key});

  @override
  Widget build(BuildContext context) {
    void _alertdialog() {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              content: SingleChildScrollView(
                child: ContainersWithinScreens.createAlertDialogWhenPrepareButtonPressed(
                  context,
                  'Chapati',
                  25,
                  Row(
                    children: [
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: Column(
                          children: [
                            ContainersWithinScreens.creatingheadingThreeColumns(
                              context,
                              'Materials used',
                              'Price',
                              'Quantity ',
                              AppColors.containerColor,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return ContainersWithinScreens.creatingheadingThreeColumns(
                                  context,
                                  'heading1',
                                  'heading2',
                                  'heading3',
                                  AppColors.surfaceColor,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.325,
                        color: AppColors.containerColor,
                        child: Text(
                          'tyo food item prepare garne process',
                          style: TextThemes.createTextTheme(context).titleSmall,
                        ),
                      ),
                    ],
                  ),
                  'materials',
                  1,
                ),
              ),
            ),
      );
    }

    final textTheme = TextThemes.createTextTheme(context);
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavigationWidget(),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Intermediate Items',
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColors.textinContainers,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFieldsTheme.createSearchField(
                      context,
                      controller,
                      'hintText',
                      (value) {},
                    ),
                  ),
                  Expanded(flex: 2, child: SizedBox()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonStyle.largePadding,
                  vertical: CommonStyle.contanersPadding,
                ),
                child: Container(
                  color: AppColors.containerColor2,
                  width: MediaQuery.of(context).size.width * 0.92,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: CommonStyle.largePadding,
                      vertical: CommonStyle.contanersPadding,
                    ),
                    child: Column(
                      children: [
                        ContainersWithinScreens.createHeadingforIntermediateItems(
                          context,
                          'items',
                          'Raw Materials',
                          'Stock Available',
                          'Required Quantity',
                          Text('Serving Quantity', style: textTheme.titleSmall),
                          Text('Actions', style: textTheme.titleSmall),

                          AppColors.containerColor,
                        ),
                        ContainersWithinScreens.createHeadingforIntermediateItems(
                          context,
                          'Chips Potato',
                          'potato',
                          '1',
                          '8',
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Card(
                                color: AppColors.buttonColor,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add, size: 16),
                                ),
                              ),
                              Text('1', style: textTheme.bodyMedium),
                              Card(
                                color: AppColors.buttonColor,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.minimize_sharp),
                                  ),
                                ),
                              ),
                            ],
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
                              _alertdialog();
                            },
                            child: Text(
                              'prepare',
                              maxLines: 1,
                              style: textTheme.bodyMedium,
                            ),
                          ),
                          AppColors.surfaceColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
