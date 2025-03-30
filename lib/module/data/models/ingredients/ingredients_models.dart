import 'package:hive_flutter/hive_flutter.dart';
part 'ingredients_models.g.dart';

@HiveType(typeId: 0)
class IngredientModels extends HiveObject {
  @HiveField(0)
  final String name;

  IngredientModels({required this.name});
// yo tala ko code test pass na bhaye paxi gareko 

// kina bhane  dart ma    var a = IngredientModels(name: 'name');
// var b = IngredientModels(name: 'name');
// print(a == b); 
// garda 
// false  aauxa   tesai le garda test garda error aayo tyo error solve garna ko lagi == operator override gareko


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IngredientModels && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;  
  //  ani hashCode  use garda  dart ma 2 oota  object ko hash code same xa vane matra true return garxa
}
