import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/common/widgets/alertboxes/alert_dialogs.dart';
import 'package:hive_project/common/widgets/containers_within_screens.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_field_theme.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/data/models/ingredients_items/ingredients_item_models.dart';
import 'package:hive_project/module/data/models/report/credit_models.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_events.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_state.dart';
import 'package:hive_project/module/presentation/screens/kitchen/preperation_process/food_preperation_by_intermediateItems.dart';
import 'package:hive_project/module/presentation/widget/navigation_widget.dart';

class IntermediateItems extends StatelessWidget {
  const IntermediateItems({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    final TextEditingController controller = TextEditingController();

    context.read<IntermediateItemsBloc>().add(LoadIntermediateItemsEvents());
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
                        BlocBuilder<
                          IntermediateItemsBloc,
                          IntermediateItemsState
                        >(
                          builder: (context, state) {
                            if (state is IntermediateItemsLoadedState) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.intermediateItems.length,
                                itemBuilder: (context, index) {
                                  final item = state.intermediateItems[index];
                                  final ingredientBox =
                                      Hive.box<IngredientsItemModels>(
                                        'ingredientItemBox',
                                      );
                                  final ingredientModel = ingredientBox.get(
                                    item.ingredientsItemModels,
                                  );
                                  final ingredientName =
                                      ingredientModel?.ingredientname ??
                                      'Unknown';

                                  return ContainersWithinScreens.createHeadingforIntermediateItems(
                                    context,
                                    item.intermediateItemName,
                                    ingredientName,
                                    item.availableQuantity.toString(),
                                    item.requiredQuantity.toString(),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed:
                                              item.availableQuantity >=
                                                      item.requiredQuantity
                                                  ? () {
                                                    context
                                                        .read<
                                                          IntermediateItemsBloc
                                                        >()
                                                        .add(
                                                          IncrementServingQuantityEvent(
                                                            index: index,
                                                          ),
                                                        );
                                                  }
                                                  : null,
                                          icon: Icon(Icons.add),
                                        ),
                                        Text(
                                          item.servingQuantity.toString(),
                                          style: textTheme.titleSmall,
                                        ),
                                        IconButton(
                                          onPressed:
                                              item.servingQuantity > 1
                                                  ? () {
                                                    context
                                                        .read<
                                                          IntermediateItemsBloc
                                                        >()
                                                        .add(
                                                          DecrementServingQuantityEvent(
                                                            index: index,
                                                          ),
                                                        );
                                                  }
                                                  : null,
                                          icon: Icon(Icons.remove),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.buttonColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              CommonStyle.contanersPadding,
                                          horizontal:
                                              CommonStyle.contanersPadding,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (item.requiredQuantity <=
                                            item.availableQuantity) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (
                                                    _,
                                                  ) => FoodListByIntermediateScreen(
                                                    selectedIntermediateItemName:
                                                        item.intermediateItemName,
                                                  ),
                                            ),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                child: AlertDialogsforScreens.createAlertContainerForNoData(
                                                  context,

                                                  'Available quantity to prepare food  is less than required, go to market and buy the required materials',
                                                  Icons.warning,
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Prepare',
                                        style: textTheme.bodyMedium,
                                      ),
                                    ),
                                    AppColors.surfaceColor,
                                  );
                                },
                              );
                            }
                            return const Center(child: Text('No items added.'));
                          },
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final creditBox = Hive.box<CreditModels>('creditReportBox');
          final creditItems = creditBox.values.toList();

          if (creditItems.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'there is no materials first buy materials from market',
                ),
              ),
            );
            return;
          }

          final result = await showDialog<Map<String, dynamic>>(
            context: context,
            builder: (context) {
              final itemNameController = TextEditingController();
              final requiredController = TextEditingController();
              final servingController = TextEditingController();
              CreditModels? selectedItem;
              double? availableQty;

              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text('Add Intermediate Item'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: itemNameController,
                            decoration: InputDecoration(
                              labelText: 'Item Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          DropdownButtonFormField<CreditModels>(
                            value: selectedItem,
                            decoration: InputDecoration(
                              labelText: 'Select Ingredient',
                              border: OutlineInputBorder(),
                            ),
                            items:
                                creditItems.map((item) {
                                  return DropdownMenuItem<CreditModels>(
                                    value: item,
                                    child: Text(item.ingredient),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value;
                                availableQty = value?.materialUnit;
                              });
                            },
                          ),
                          if (availableQty != null) ...[
                            SizedBox(height: 8),
                            Text('Available: $availableQty'),
                          ],
                          SizedBox(height: 16),
                          TextField(
                            controller: requiredController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Required Quantity',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: servingController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Serving Quantity',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (itemNameController.text.isEmpty ||
                              selectedItem == null ||
                              requiredController.text.isEmpty ||
                              servingController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Fill all the fields')),
                            );
                            return;
                          }

                          Navigator.pop(context, {
                            'name': itemNameController.text,
                            'ingredient': selectedItem!,
                            'required': double.parse(requiredController.text),
                            'serving': double.parse(servingController.text),
                          });
                        },
                        child: Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
          );

          if (result != null) {
            context.read<IntermediateItemsBloc>().add(
              AddIntermediateItemsEvents(
                intermediateItemName: result['name'],
                ingredientsItemModels: result['ingredient'].key as int,
                availableQuantity: result['ingredient'].materialUnit.toInt(),
                requiredQuantity: result['required'].toInt(),
                servingQuantity: result['serving'].toInt(),
              ),
            );
          }
        },
        label: Text('Add Intermediate items'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
