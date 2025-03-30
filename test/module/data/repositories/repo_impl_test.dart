import 'package:hive_project/module/data/repositories/food_prep_repo_impl.dart';
import 'package:hive_project/module/data/repositories/ingredients_items_repo_impl.dart';
import 'package:hive_project/module/data/repositories/ingredients_repo_impl.dart';
import 'package:hive_project/module/data/repositories/intermediate_items_repo_impl.dart';
import 'package:hive_project/module/data/repositories/report/credit_report_repo_impl.dart';
import 'package:hive_project/module/data/repositories/report/debit_report_repo_impl.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  IngredientsRepoImpl,
  IngredientsItemsRepoImpl,
  IntermediateItemsRepoImpl,
  FoodPrepRepoImpl,
  CreditReportRepoImpl,
  DebitReportRepoImpl,

])
void main() {}