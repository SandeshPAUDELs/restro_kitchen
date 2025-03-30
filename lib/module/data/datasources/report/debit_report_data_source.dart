import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/report/debit_models.dart';

abstract class DebitReportDataSource {
  List<DebitModels> getDebitReportItems();

  Future<void> addDebitReportItems(String foodName, int servingQuantity);
}

class DebitReportDataSourceImpl extends DebitReportDataSource {
  final Box<DebitModels> debitReportBox;
  DebitReportDataSourceImpl({required this.debitReportBox});

  @override
  Future<void> addDebitReportItems(String foodName, int servingQuantity) async {
    await debitReportBox.add(
      DebitModels(foodName: foodName, servingQuantity: servingQuantity),
    );
  }

  @override
  List<DebitModels> getDebitReportItems() {
    return debitReportBox.values.toList();
  }
}
