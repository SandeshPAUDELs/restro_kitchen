import 'package:hive_project/module/data/datasources/report/debit_report_data_source.dart';
import 'package:hive_project/module/domain/entities/report/debit_report_entities.dart';
import 'package:hive_project/module/domain/repositories/report/debit_report_repo.dart';

class DebitReportRepoImpl implements DebitReportRepo{
  final DebitReportDataSource debitReportDataSource;
  DebitReportRepoImpl({required this.debitReportDataSource});

  @override
  Future<void> addDebitReportItems(String foodName, int servingQuantity) {
    return debitReportDataSource.addDebitReportItems(foodName, servingQuantity);
  }

  @override
  List<DebitReportEntities> getDebitReportItems() {
    final debitReportItems = debitReportDataSource.getDebitReportItems();
    return debitReportItems
        .map(
          (e) => DebitReportEntities(
            foodName: e.foodName,
            servingQuantity: e.servingQuantity,
          ),
        )
        .toList();
  }
}