import 'package:hive/hive.dart';
import 'package:hive_project/module/data/datasources/food_prep_data_source.dart';
import 'package:hive_project/module/data/datasources/ingredients_data_source.dart';
import 'package:hive_project/module/data/datasources/ingredients_items_data_source.dart';
import 'package:hive_project/module/data/datasources/intermediate_items_data_source.dart';
import 'package:hive_project/module/data/datasources/report/credit_report_data_source.dart';
import 'package:hive_project/module/data/datasources/report/debit_report_data_source.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  IngredientsDataSource,
  IngredientsDataSourceImpl,
  IngredientsItemsDataSource,
  IngredientsItemsDataSourceImpl,
  IntermediateItemsDataSource,
  IntermediateItemsDataSourceImpl,
  FoodPrepDataSource, 
  FoodPrepDataSourceImpl,
  CreditReportDataSource,
  CreditReportDataSourceImpl,
  DebitReportDataSource,
  DebitReportDataSourceImpl,
  Box,
])
void main() {}
