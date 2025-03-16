import 'package:hive_flutter/hive_flutter.dart';

class IngredientDataBase {
  List ingredientList = [];

  final _myBox = Hive.box('mybox');
  void createInitialData() {
    ingredientList = [
      ['Fruit'],
      ['Vegetable'],
    ];
  }

void loadData() {
  ingredientList = _myBox.get('INGREDIENTLIST');
}

  void updateDataBase(){
    _myBox.put('INGREDIENTLIST', ingredientList);
  }
}