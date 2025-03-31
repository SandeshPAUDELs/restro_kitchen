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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DebitModels &&
        other.foodName == foodName &&
        other.servingQuantity == servingQuantity;
  }

  @override
  int get hashCode {
    return foodName.hashCode ^ servingQuantity.hashCode;
  }
}