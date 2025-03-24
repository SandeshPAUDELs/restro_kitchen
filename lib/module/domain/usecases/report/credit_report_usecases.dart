import 'package:hive_project/module/domain/entities/report/credit_report_etities.dart';
import 'package:hive_project/module/domain/repositories/report/credit_report_repo.dart';

class CreditReportUsecases {
  final CreditReportRepo creditReport;
  CreditReportUsecases(this.creditReport);

  List<CreditEntities> getCreditReportItems() {
    return creditReport.getCreditReportItems();
  }

  Future<void> addCreditReportItems(
    String ingredient,
    double price,
    double materialUnit,
  ) {
    return creditReport.addCreditReportItems(ingredient, price, materialUnit);
  }
}
