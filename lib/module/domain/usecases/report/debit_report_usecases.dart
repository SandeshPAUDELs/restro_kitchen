import 'package:hive_project/module/domain/entities/report/debit_report_entities.dart';
import 'package:hive_project/module/domain/repositories/report/debit_report_repo.dart';

class DebitReportUsecases {
  final DebitReportRepo debitReport;
  DebitReportUsecases(this.debitReport);

  List<DebitReportEntities> getDebitReportItems() {
    return debitReport.getDebitReportItems();
  }

  Future<void> addDebitReportItems(String foodName, int servingQuantity) {
    return debitReport.addDebitReportItems(foodName, servingQuantity);
  }
  
}