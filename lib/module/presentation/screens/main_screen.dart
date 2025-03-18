import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_state.dart';
import 'package:hive_project/module/presentation/screens/seller_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IngredientsBloc>().add(LoadIngredientsEvents());
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Ingredients')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Ingredient Name',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill the form and submit'),
                        ),
                      );
                    } else {
                      context.read<IngredientsBloc>().add(
                        AddIngredientsEvents(name: _controller.text),
                      );
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
            ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IngredientItemsScreen()),
            ),
            child: const Text('Add Ingredient Item'),
            ),

          Expanded(
            child: BlocBuilder<IngredientsBloc, IngredientsState>(
              builder: (context, state) {
                if (state is IngredientsLoadedState) {
                  return ListView.builder(
                    itemCount: state.ingredients.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.ingredients[index].name),
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
    );

  }
}
