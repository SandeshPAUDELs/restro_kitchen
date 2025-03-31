import 'package:hive/hive.dart';
part 'credit_models.g.dart';

@HiveType(typeId : 5)
class CreditModels extends HiveObject{
  @HiveField(0)
  String ingredient;
  @HiveField(1)
  double price;
  @HiveField(2)
  double materialUnit;

  CreditModels({
    required this.ingredient,
    required this.price,
    required this.materialUnit, 
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditModels &&
        other.ingredient == ingredient &&
        other.price == price &&
        other.materialUnit == materialUnit;
  }

  @override
  int get hashCode {
    return ingredient.hashCode ^ price.hashCode ^ materialUnit.hashCode;
  }

}