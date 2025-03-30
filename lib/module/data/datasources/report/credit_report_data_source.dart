import 'package:hive/hive.dart';
import 'package:hive_project/module/data/models/report/credit_models.dart';

abstract class CreditReportDataSource {
  List<CreditModels> getCreditReportItems();
  Future<void> addCreditReportItems(
    String ingredient,
    double price,
    double materialUnit,
  );
}

// class CreditReportDataSourceImpl extends CreditReportDataSource {
//   final Box<CreditModels> creditReportBox;
//   CreditReportDataSourceImpl({required this.creditReportBox});

//   @override
//   Future<void> addCreditReportItems(
//     String ingredient,
//     double price,
//     double materialUnit,
//   ) async {
//     await creditReportBox.add(
//       CreditModels(
//         ingredient: ingredient,
//         price: price,
//         materialUnit: materialUnit,
//       ),
//     );
//   }

//   @override
//   List<CreditModels> getCreditReportItems() {
//     return creditReportBox.values.toList();
//   }
// }
class CreditReportDataSourceImpl extends CreditReportDataSource {
  final Box<CreditModels> creditReportBox;
  CreditReportDataSourceImpl({required this.creditReportBox});

  @override
  Future<void> addCreditReportItems(
    String ingredient,
    double price,
    double materialUnit,
  ) async {
    final existingIndex = creditReportBox.values.toList().indexWhere(
          (item) => item.ingredient == ingredient,
        );

    if (existingIndex >= 0) {
      final existingItem = creditReportBox.getAt(existingIndex);
      if (existingItem != null) {
        await creditReportBox.putAt(
          existingIndex,
          CreditModels(
            ingredient: ingredient,
            price: price, 
            materialUnit: existingItem.materialUnit + materialUnit,
          ),
        );
      }
    } else {
      await creditReportBox.add(
        CreditModels(
          ingredient: ingredient,
          price: price,
          materialUnit: materialUnit,
        ),
      );
    }
  }

  @override
  List<CreditModels> getCreditReportItems() {
    return creditReportBox.values.toList();
  }
}