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

}