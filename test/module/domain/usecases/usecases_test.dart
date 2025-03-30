import 'package:hive_project/module/domain/usecases/food_prep_usecases.dart';
import 'package:hive_project/module/domain/usecases/ingredients_items_usecases.dart';
import 'package:hive_project/module/domain/usecases/ingredients_usecases.dart';
import 'package:hive_project/module/domain/usecases/intermediate_items_usecases.dart';
import 'package:hive_project/module/domain/usecases/report/credit_report_usecases.dart';
import 'package:hive_project/module/domain/usecases/report/debit_report_usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([IngredientsUsecases, IngredientsItemsUsecases, IntermediateItemsUsecases, FoodPrepUsecases, CreditReportUsecases, DebitReportUsecases])
void main(){
}