
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';
import 'package:hive_project/module/presentation/bloc/food/food_item_state.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_events.dart';
import 'package:hive_project/module/presentation/screens/kitchen/preperation_process/food_prep_guide.dart';

class FoodListByIntermediateScreen extends StatelessWidget {
  final String selectedIntermediateItemName;

  const FoodListByIntermediateScreen({
    super.key,
    required this.selectedIntermediateItemName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    context.read<FoodPrepBloc>().add(LoadFoodPrepItemsEvent());

    return Scaffold(
      appBar: AppBar(title: Text('Foods with "$selectedIntermediateItemName"')),
      body: BlocBuilder<FoodPrepBloc, FoodPrepState>(
        builder: (context, state) {
          if (state is FoodPrepLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FoodPrepLoaded) {
            final intermediateItemBox = Hive.box<IntermediateItemsModels>(
              'intermediateItemsBox',
            );

            final filteredFoods =
                state.foods.where((food) {
                  final intermediateItem = intermediateItemBox.get(
                    food.intermediateItemsModels,
                  );
                  return intermediateItem?.intermediateItemName ==
                      selectedIntermediateItemName;
                }).toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                final food = filteredFoods[index];
                final intermediateItem = intermediateItemBox.get(
                  food.intermediateItemsModels,
                );
                final intermediateItemName =
                    intermediateItem?.intermediateItemName ?? '';
                final requiredQuantity =
                    intermediateItem?.requiredQuantity ?? 0;
                final servingQuantity = intermediateItem?.servingQuantity ?? 0;

                return GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => FoodDetailsScreen(
                                food: food,
                                intermediateItemName: intermediateItemName,
                                requiredQuantity: requiredQuantity.toDouble(),
                                servingQuantity: servingQuantity,
                              ),
                        ),
                      ),
                  child: Card(
                    color: AppColors.surfaceColor,
                    child: ListTile(
                      title: Text(
                        food.foodName,
                        style: textTheme.headlineSmall,
                      ),
                      subtitle: Text(
                        'Intermediate Item: $intermediateItemName',
                        style: textTheme.bodyMedium,
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
    );
  }
}
