import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/presentation/bloc/food/food_item_state.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_events.dart';
import 'package:hive_project/module/presentation/screens/kitchen/preperation_process/food_prep_guide.dart';
import 'package:hive_project/module/presentation/widget/forms_widget_for_food.dart';
import 'package:hive_project/module/presentation/widget/navigation_widget.dart';

class AddFoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<FoodPrepBloc>().add(LoadFoodPrepItemsEvent());
    return Scaffold(
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
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoodDetailsScreen(food: food))),
                        child: ListTile(
                          title: Text(food.foodName),
                          
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

