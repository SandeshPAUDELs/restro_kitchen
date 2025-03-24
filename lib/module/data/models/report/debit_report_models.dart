import 'package:hive/hive.dart';
part 'debit_report_models.g.dart';

@HiveType(typeId: 6)
class DebitReportModels extends HiveObject{
  @HiveField(0)
  String foodName;
  @HiveField(1)
  int servingQuantity;
  DebitReportModels({
    required this.foodName,
    required this.servingQuantity,
  });
}