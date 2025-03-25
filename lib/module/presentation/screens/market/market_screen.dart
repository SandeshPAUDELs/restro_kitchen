import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/common/widgets/containers_within_screens.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_state.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_state.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_events.dart';
import 'package:hive_project/module/presentation/widget/navigation_widget.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int selectedIngredientKey = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IngredientsBloc>().add(LoadIngredientsEvents());
      context.read<IngredientsItemsBloc>().add(LoadIngredientsItemsEvents());
    });
  }

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
                              'Available Market Items',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          BlocBuilder<IngredientsBloc, IngredientsState>(
                            builder: (context, state) {
                              if (state is IngredientsLoadedState) {
                                if (state.ingredients.isEmpty) {
                                  return const Center(
                                    child: Text("No Ingredients Available"),
                                  );
                                }

                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: state.ingredients.length,
                                    itemBuilder: (context, index) {
                                      final ingredient =
                                          state.ingredients[index];

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical:
                                              CommonStyle.contanersPadding,
                                          horizontal: CommonStyle.screenpadding,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                selectedIngredientKey == index
                                                    ? AppColors
                                                        .alertColorsforPreparingFood
                                                    : AppColors.containerColor2,
                                            border: Border.all(
                                              color: AppColors.containerColor,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: ListTile(
                                            title: Text(
                                              ingredient.name,
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                    color:
                                                        selectedIngredientKey ==
                                                                index
                                                            ? AppColors
                                                                .textinContainers
                                                            : AppColors
                                                                .backgroundColor,
                                                  ),
                                            ),
                                            selected:
                                                index == selectedIngredientKey,
                                            onTap: () {
                                              setState(() {
                                                selectedIngredientKey = index;
                                              });
                                              context
                                                  .read<IngredientsItemsBloc>()
                                                  .add(
                                                    LoadIngredientItemsByIngredientEvent(
                                                      ingredientKey: index,
                                                    ),
                                                  );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  Expanded(
                    flex: 5,
                    child: ContainersWithinScreens.createEmptyContainer(
                      context,
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ContainersWithinScreens.createheadingforMarket(
                              context,
                              'Ingredient Name',
                              'Price',
                              'Units',
                              Text('Action', style: textTheme.bodyMedium),
                              AppColors.containerColor,
                            ),

                            BlocBuilder<
                              IngredientsItemsBloc,
                              IngredientsItemsState
                            >(
                              builder: (context, state) {
                                if (state is IngredientsItemsLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state
                                    is IngredientsItemsLoadedState) {
                                  if (state.ingredientItems.isEmpty) {
                                    return const Center(
                                      child: Text("No Items Available"),
                                    );
                                  }

                                  return SingleChildScrollView(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.ingredientItems.length,
                                      itemBuilder: (context, index) {
                                        final item =
                                            state.ingredientItems[index];
                                        return ContainersWithinScreens.createheadingforMarket(
                                          context,
                                          item.ingredientname,
                                          item.price.toString(),
                                          item.materialsUnit.toString(),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.buttonColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical:
                                                    CommonStyle
                                                        .contanersPadding,
                                                horizontal:
                                                    CommonStyle
                                                        .contanersPadding,
                                              ),
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<CreditReportBloc>()
                                                  .add(
                                                    AddCreditReportEvents(
                                                      ingredient:
                                                          item.ingredientname,
                                                      price: item.price,
                                                      materialUnit:
                                                          item.materialsUnit
                                                              .toDouble(),
                                                    ),
                                                  );

                                            },
                                            


                                            child: Text(
                                              'Buy',
                                              style: textTheme.bodyMedium,
                                            ),
                                          ),
                                          AppColors.surfaceColor,
                                        );
                                      },
                                    ),
                                  );
                                }
                                return const Center(child: Text('No Data'));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
