import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<IngredientsBloc>().add(LoadIngredientsEvents());
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: const InputDecoration(labelText: 'Enter Ingredient Name'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                if (_controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill the form and submit')),
                  );
                } else {
                  context.read<IngredientsBloc>().add(AddIngredientsEvents(name: _controller.text));
                  _controller.clear();
                }
                },
              ),
              ],
            ),
          ),
          
          Expanded(
            child: BlocBuilder<IngredientsBloc, IngredientsState>(
              builder: (context, state) {
                if (state is IngredientsLoadedState) {
                  return ListView.builder(
                    itemCount: state.ingredients.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(state.ingredients[index].name));
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
