import 'package:hive_project/module/domain/entities/report/credit_report_etities.dart';

abstract class CreditReportRepo {
  List<CreditEntities> getCreditReportItems();
  Future<void> addCreditReportItems(
    String ingredient,
    double price,
    double materialUnit,
  );
}
