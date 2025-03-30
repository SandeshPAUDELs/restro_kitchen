import 'package:hive/hive.dart';
part 'debit_models.g.dart';

@HiveType(typeId: 6)
class DebitModels extends HiveObject{
  @HiveField(0)
  String foodName;
  @HiveField(1)
  int servingQuantity;
  DebitModels({
    required this.foodName,
    required this.servingQuantity,
  });
}