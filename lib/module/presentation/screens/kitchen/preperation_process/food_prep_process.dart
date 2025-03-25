import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';
import 'package:hive_project/module/presentation/bloc/food/food_item_state.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_events.dart';
import 'package:hive_project/module/presentation/screens/kitchen/preperation_process/food_prep_steps.dart';
import 'package:hive_project/module/presentation/widget/forms_widget_for_food.dart';
import 'package:hive_project/module/presentation/widget/navigation_widget.dart';

class AddFoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<FoodPrepBloc>().add(LoadFoodPrepItemsEvent());
    return Scaffold(
      backgroundColor: AppColors.containerColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationWidget(),
            BlocBuilder<FoodPrepBloc, FoodPrepState>(
              builder: (context, state) {
                if (state is FoodPrepLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FoodPrepLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.foods.length,
                    itemBuilder: (context, index) {
                      final food = state.foods[index];
                      final intermediateItemBox =
                          Hive.box<IntermediateItemsModels>(
                            'intermediateItemsBox',
                          );
                      final intermediateItem = intermediateItemBox.get(
                        food.intermediateItemsModels,
                      );
                      final intermediateItemName =
                          intermediateItem?.intermediateItemName ?? '';
                      final requiredQuantity =
                          intermediateItem?.requiredQuantity ?? 0;

                      final servingQuantity =
                          intermediateItem?.servingQuantity ?? 0;

                      return GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => FoodPreeperationDetailsScreen(
                                      food: food,
                                      intermediateItemName:
                                          intermediateItemName,
                                      requiredQuantity:
                                          requiredQuantity.toDouble(),
                                      servingQuantity: servingQuantity,
                                    ),
                              ),
                            ),
                        child: Card(
                          color: AppColors.surfaceColor,
                          child: ListTile(
                            title: Text(
                              food.foodName,
                              style:
                                  TextThemes.createTextTheme(
                                    context,
                                  ).headlineSmall,
                            ),
                            subtitle: Text(
                              'intermediateItem: $intermediateItemName',
                              style:
                                  TextThemes.createTextTheme(
                                    context,
                                  ).bodyMedium,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is FoodPrepError) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text("No data"));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (_) => AddFoodDialog());
        },
      ),
    );
  }
}
