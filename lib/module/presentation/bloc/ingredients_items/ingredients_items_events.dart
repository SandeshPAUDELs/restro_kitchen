import 'package:equatable/equatable.dart';

class IngredientsItemsEvents extends Equatable {
  const IngredientsItemsEvents();
  @override
  List<Object> get props => [];
}

class LoadIngredientsItemsEvents extends IngredientsItemsEvents {}

class AddIngredientsItemsEvents extends IngredientsItemsEvents {
  final String ingredientname;
  final int ingredientModels;
  final double price;
  final int materialsUnit;
  const AddIngredientsItemsEvents({
    required this.ingredientname,
    required this.ingredientModels,
    required this.price,
    required this.materialsUnit,
  });
  @override
  List<Object> get props => [
    ingredientname,
    ingredientModels,
    price,
    materialsUnit,
  ];
}

// ingredients anusar ingredients items
class LoadIngredientItemsByIngredientEvent extends IngredientsItemsEvents {
  final int ingredientKey;

  const LoadIngredientItemsByIngredientEvent({required this.ingredientKey});

  @override
  List<Object> get props => [ingredientKey];
}

/// increment by 1
class IncrementMaterialsUnitEvent extends IngredientsItemsEvents {
  final String ingredientName;

  const IncrementMaterialsUnitEvent({required this.ingredientName});

  @override
  List<Object> get props => [ingredientName];
}

// decrement by 1
class DecrementMaterialsUnitEvent extends IngredientsItemsEvents {
  final String ingredientName;

  const DecrementMaterialsUnitEvent({required this.ingredientName});

  @override
  List<Object> get props => [ingredientName];
}
