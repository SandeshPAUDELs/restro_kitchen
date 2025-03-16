import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/databases/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('mybox');
  final IngredientDataBase db = IngredientDataBase();

  @override
  void initState() {
    if (_myBox.get('ingredientList') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: db.ingredientList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(db.ingredientList[index][0]),
            subtitle: Text(db.ingredientList[index][0]),
          );
        },
      ),
    );
  }
}
