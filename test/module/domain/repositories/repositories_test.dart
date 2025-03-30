import 'package:hive_project/module/domain/repositories/food_prep_repo.dart';
import 'package:hive_project/module/domain/repositories/ingredients_items_repo.dart';
import 'package:hive_project/module/domain/repositories/ingredients_repo.dart';
import 'package:hive_project/module/domain/repositories/intermediate_items_repo.dart';
import 'package:hive_project/module/domain/repositories/report/credit_report_repo.dart';
import 'package:hive_project/module/domain/repositories/report/debit_report_repo.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  IngredientsRepo,
  IngredientsItemsRepo,
  IntermediateItemsRepo,
  FoodPrepRepo,
  CreditReportRepo,
  DebitReportRepo,
])
void main() {}
