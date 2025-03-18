import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/module/data/models/ingredients/ingredients_models.dart';
import 'package:hive_project/module/data/models/ingredients_items/ingredients_item_models.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_events.dart';

class IngredientItemsScreen extends StatefulWidget {
  const IngredientItemsScreen({super.key});

  @override
  _IngredientItemsScreenState createState() => _IngredientItemsScreenState();
}

class _IngredientItemsScreenState extends State<IngredientItemsScreen> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  IngredientModels? _selectedIngredient;

  @override
  Widget build(BuildContext context) {
    final Box<IngredientModels> ingredientBox =
        Hive.box<IngredientModels>('ingredientBox');

    return Scaffold(
      appBar: AppBar(title: const Text('Add Ingredient Item')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButton<IngredientModels>(
                  hint: const Text('Select Ingredient'),
                  value: _selectedIngredient, 
                  isExpanded: true,
                  items: ingredientBox.values.map((ingredient) {
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
                ),
                TextField(
                    controller: _itemNameController,
                    decoration: const InputDecoration(labelText: 'Item Name')),
                TextField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: _unitController,
                    decoration: const InputDecoration(labelText: 'Units'),
                    keyboardType: TextInputType.number),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      final name = _itemNameController.text.trim();
                      final price = double.tryParse(_priceController.text) ?? 0.0;
                      final units = int.tryParse(_unitController.text) ?? 1;

                      if (name.isNotEmpty && _selectedIngredient != null) {
                        _itemNameController.clear();
                        _priceController.clear();
                        _unitController.clear();
                        context.read<IngredientsItemsBloc>().add(
                          AddIngredientsItemsEvents(
                            ingredientname: name,
                            ingredientModels: _selectedIngredient!.key as int, 
                            price: price,
                            materialsUnit: units,
                          ),
                        );
                      }
                    },
                    child: const Text('Add Item')),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<IngredientsItemModels>('ingredientItemBox')
                      .listenable(),
              builder: (context, Box<IngredientsItemModels> box, _) {
                final filteredItems = box.values.toList();
                if (filteredItems.isEmpty) {
                  return const Center(child: Text('No items added.'));
                }
                return ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return ListTile(
                      title: Text(item.ingredientname),
                      subtitle: Text(
                            'Ingredient: ${ingredientBox.get(item.ingredientModels)?.name ?? "Unknown"}, Price: \$${item.price}, Units: ${item.materialsUnit}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
