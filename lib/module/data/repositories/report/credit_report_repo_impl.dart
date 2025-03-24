import 'package:hive_project/module/data/datasources/report/credit_report_data_source.dart';
import 'package:hive_project/module/domain/entities/report/credit_report_etities.dart';
import 'package:hive_project/module/domain/repositories/report/credit_report_repo.dart';

class CreditReportRepoImpl implements CreditReportRepo {
  final CreditReportDataSource creditReportDataSource;
  CreditReportRepoImpl({required this.creditReportDataSource});

  @override
  Future<void> addCreditReportItems(
    String ingredient,
    double price,
    double materialUnit,
  ) {
    return creditReportDataSource.addCreditReportItems(
      ingredient,
      price,
      materialUnit,
    );
  }

  @override
  List<CreditEntities> getCreditReportItems() {
    final creditReportItems = creditReportDataSource.getCreditReportItems();
    return creditReportItems
        .map(
          (e) => CreditEntities(
            ingredient: e.ingredient,
            price: e.price,
            materialUnit: e.materialUnit,
          ),
        )
        .toList();
  }
}
