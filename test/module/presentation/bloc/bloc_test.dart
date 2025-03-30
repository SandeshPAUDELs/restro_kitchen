import 'package:hive_project/module/presentation/bloc/food/food_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients/ingredients_bloc.dart';
import 'package:hive_project/module/presentation/bloc/ingredients_items/ingredients_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/intermediate_items/intermediate_items_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([IngredientsBloc, IngredientsItemsBloc, IntermediateItemsBloc, FoodPrepBloc, CreditReportBloc, DebitReportBloc])
void main() {}