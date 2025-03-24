import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/common/widgets/containers_within_screens.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/app_bar_theme.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_field_theme.dart';
import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_state.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});

  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  IngredientModels? _selectedIngredient;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<IngredientsItemsBloc>().add(LoadIngredientsItemsEvents());
  }

  @override
  Widget build(BuildContext context) {
    final Box<IngredientModels> ingredientBox = Hive.box<IngredientModels>(
      'ingredientBox',
    );
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: CustomeAppBarTheme.appBarThemewithNavigation(
        context,
        'Add Ingredient Item',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          children: [
            ContainersWithinScreens.creatingheadingThreeColumns(
              context,
              'Item Name',
              'Price',
              'Units',
              AppColors.containerColor,
            ),

            Expanded(
              child: BlocBuilder<IngredientsItemsBloc, IngredientsItemsState>(
                builder: (context, state) {
                  if (state is IngredientsItemsLoadedState) {
                    return ListView.builder(
                      itemCount: state.ingredientItems.length,
                      itemBuilder: (context, index) {
                        final item = state.ingredientItems[index];
                        return ContainersWithinScreens.createTableBodyThreeColumns(
                          context,
                          item.ingredientname,
                          item.price.toString(),
                          item.materialsUnit.toString(),

                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  context.read<IngredientsItemsBloc>().add(
                                    DecrementMaterialsUnitEvent(
                                      ingredientName: item.ingredientname,
                                    ),
                                  );
                                },
                              ),
                              Text(
                                item.materialsUnit.toString(),
                                maxLines: 1,
                                style: textTheme.titleSmall,
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  context.read<IngredientsItemsBloc>().add(
                                    IncrementMaterialsUnitEvent(
                                      ingredientName: item.ingredientname,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: Text('No items added.'));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Ingredient Item'),
                content: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        DropdownButtonFormField<IngredientModels>(
                          decoration: const InputDecoration(
                            labelText: 'Select Ingredient',
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Select Ingredient'),
                          value: _selectedIngredient,
                          isExpanded: true,
                          items:
                              ingredientBox.values.map((ingredient) {
                                return DropdownMenuItem(
                                  value: ingredient,
                                  child: Text(ingredient.name),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedIngredient = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select an ingredient';
                            }
                            return null;
                          },
                        ),
                        TextFieldsTheme.createTextField(
                          context,
                          _itemNameController,
                          'Item Name',
                          (value) {
                            if (value == null || value.isEmpty) {
                              return 'you SHOULD NOT  MAKE it empty';
                            }
                            return null;
                          },
                        ),
                        TextFieldsTheme.createTextField(
                          context,
                          _priceController,
                          'Price',
                          (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a price';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),

                        TextFieldsTheme.createTextField(
                          context,
                          _unitController,
                          'Units',
                          (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the number of units';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            final name = _itemNameController.text.trim();
                            final price =
                                double.tryParse(_priceController.text) ?? 0.0;
                            final units =
                                int.tryParse(_unitController.text) ?? 1;
                            if (_formKey.currentState!.validate()) {
                              _itemNameController.clear();
                              _priceController.clear();
                              _unitController.clear();
                              Navigator.pop(context);
                              context.read<IngredientsItemsBloc>().add(
                                AddIngredientsItemsEvents(
                                  ingredientname: name,
                                  ingredientModels:
                                      _selectedIngredient!.key as int,
                                  price: price,
                                  materialsUnit: units,
                                ),
                              );
                            }
                          },
                          child: const Text('Add Item'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        label: const Text('Add Ingredient Item'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
