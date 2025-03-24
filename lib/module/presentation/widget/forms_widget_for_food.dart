import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/intermediate_items/intermediate_item_models.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/food/food_items_events.dart';
import 'package:hive_project/module/presentation/bloc/forms_auto_inrement/forms_auto_increment_bloc.dart';
import 'package:hive_project/module/presentation/bloc/forms_auto_inrement/forms_auto_increment_events.dart';
import 'package:hive_project/module/presentation/bloc/forms_auto_inrement/forms_auto_increment_state.dart';

class AddFoodDialog extends StatefulWidget {
  AddFoodDialog({super.key});

  @override
  _AddFoodDialogState createState() => _AddFoodDialogState();
}

class _AddFoodDialogState extends State<AddFoodDialog> {
  final foodNameController = TextEditingController();
  IntermediateItemsModels? selectedIntermediateItem;

  List<TextEditingController> itemControllers = [];
  List<TextEditingController> qtyControllers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    foodNameController.dispose();
    for (var controller in itemControllers) {
      controller.dispose();
    }
    for (var controller in qtyControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final intermediateItemsBox = Hive.box<IntermediateItemsModels>("intermediateItemsBox");

    return Builder(
      builder: (context) {
        return AlertDialog(
          title: Text("Add Food"),
          content: BlocBuilder<FormsBloc, FormsState>(
            builder: (context, state) {
              if (state is FormLoadedState) {
                if (itemControllers.length != state.forms.length) {
                  for (var controller in itemControllers) {
                    controller.dispose();
                  }
                  for (var controller in qtyControllers) {
                    controller.dispose();
                  }

                  itemControllers.clear();
                  qtyControllers.clear();

                  for (var item in state.forms) {
                    itemControllers.add(TextEditingController(text: item.itemName));
                    qtyControllers.add(TextEditingController(text: item.quantity.toString()));
                  }
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: foodNameController,
                        decoration: InputDecoration(labelText: "Food Name"),
                      ),
                      DropdownButtonFormField<IntermediateItemsModels>(
                        decoration: InputDecoration(
                          labelText: 'Select IntermediateItem',
                          border: OutlineInputBorder(),
                        ),
                        items: intermediateItemsBox.values.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.intermediateItemName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedIntermediateItem = value;
                        },
                      ),
                      SizedBox(height: 10),
                      ...List.generate(state.forms.length, (i) {
                        final item = state.forms[i];

                        return Column(
                          children: [
                            TextField(
                              controller: itemControllers[i], 
                              decoration: InputDecoration(labelText: "Item"),
                              onChanged: (val) {
                                context.read<FormsBloc>().add(
                                  UpdateAdditionalFormEvent(
                                    index: i,
                                    itemName: val,
                                    quantity: item.quantity,
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 8),
                            
                            TextField(
                              controller: qtyControllers[i ],
                              decoration: InputDecoration(labelText: "Qty"),
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                final parsed = double.tryParse(val) ?? 0;
                                context.read<FormsBloc>().add(
                                      UpdateAdditionalFormEvent(
                                        index: i,
                                        itemName: item.itemName,
                                        quantity: parsed,
                                      ),
                                    );
                              },
                            ),
                          ],
                        );
                      }),
                      TextButton(
                        onPressed: () {
                          context.read<FormsBloc>().add(AddnewFormEvent());
                          setState(() {
                            itemControllers.add(TextEditingController());
                            qtyControllers.add(TextEditingController());
                          });
                        },
                        child: Text("+ Add Item"),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final name = foodNameController.text;
                final inter = selectedIntermediateItem;
                final formsState = context.read<FormsBloc>().state;

                if (formsState is FormLoadedState && inter != null) {
                  final validItems = formsState.forms
                      .where((f) => f.itemName.isNotEmpty && f.quantity > 0)
                      .toList();

                  context.read<FoodPrepBloc>().add(
                    AddFoodPrepItemEvent(
                      foodName: name,
                      intermediateItemsModels: inter.key as int,
                      otherItems: validItems,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
