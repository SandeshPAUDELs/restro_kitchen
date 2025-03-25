import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/core/config/routes/routes_name.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/app_bar_theme.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_field_theme.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_events.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IngredientsBloc>().add(LoadIngredientsEvents());
    });
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: CustomeAppBarTheme.appBarThemeforPages(
        context,
        'Ingredients Screen',
      ),
      body: Column(
        children: [
          

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.actionBtnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                vertical: CommonStyle.contanersPadding,
                horizontal: CommonStyle.contanersPadding,
              ),
            ),
            onPressed:
                () => Navigator.pushNamed(context, AppRoutesName.sellerScreen),
            child: const Text('Enter Into Market'),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Ingredient'),
                content: Form(
                  key: _formKey,

                  child: TextFieldsTheme.createTextField(
                    context,
                    _controller,
                    'Add Ingredient',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'you SHOULD NOT  MAKE it empty';
                      }
                      return null;
                    },
                  ),
                  // ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<IngredientsBloc>().add(
                          AddIngredientsEvents(name: _controller.text),
                        );
                        _controller.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        label: Text('Add Ingredient'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
