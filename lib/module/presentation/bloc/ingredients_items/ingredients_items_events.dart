import 'package:equatable/equatable.dart';

class IngredientsItemsEvents extends Equatable{
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
  const AddIngredientsItemsEvents({required this.ingredientname, required this.ingredientModels, required this.price, required this.materialsUnit});

  @override
  List<Object> get props => [ingredientname, ingredientModels, price, materialsUnit];
}