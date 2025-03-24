import 'package:hive_project/module/domain/entities/report/debit_report_entities.dart';

abstract class DebitReportRepo {
  List<DebitReportEntities> getDebitReportItems();
  Future<void> addDebitReportItems(String foodName, int servingQuantity);
}