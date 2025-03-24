import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/Report/debit_report_models.dart';

abstract class DebitReportDataSource {
  List<DebitReportModels> getDebitReportItems();
  Future<void> addDebitReportItems(String foodName, int servingQuantity);
}

class DebitReportDataSourceImpl extends DebitReportDataSource {
  final Box<DebitReportModels> debitReportBox;
  DebitReportDataSourceImpl({required this.debitReportBox});

  @override
  Future<void> addDebitReportItems(String foodName, int servingQuantity) async {
    await debitReportBox.add(DebitReportModels(foodName: foodName, servingQuantity: servingQuantity));
  }

  @override
  List<DebitReportModels> getDebitReportItems() {
    return debitReportBox.values.toList();
  }

}