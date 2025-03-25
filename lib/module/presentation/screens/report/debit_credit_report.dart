import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/common/widgets/containers_within_screens.dart';
import 'package:hive_project/core/config/themes/colors.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_events.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_state.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_events.dart';
import 'package:hive_project/module/presentation/bloc/report/debit_report/debit_report_state.dart';
import 'package:hive_project/module/presentation/widget/navigation_widget.dart';

class DebitCreditReport extends StatelessWidget {
  const DebitCreditReport({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    context.read<CreditReportBloc>().add(LoadCreditReportEvents());
    context.read<DebitReportBloc>().add(LoadDebitReporrtEvents());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationWidget(),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              color: AppColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonStyle.screenpadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: CommonStyle.contanersPadding,
                        ),
                        child: ContainersWithinScreens.createEmptyContainer(
                          context,
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: AppColors.containerColor3,
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Credit Report',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: textTheme.headlineSmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  color: AppColors.containerColor2,
                                  child: Column(
                                    children: [
                                      ContainersWithinScreens.creatingheadingThreeColumns(
                                        context,
                                        'Materials used',
                                        'Price',
                                        'Quantity ',
                                        AppColors.containerColor,
                                      ),
                                      Expanded(
                                        child: BlocBuilder<
                                          CreditReportBloc,
                                          CreditReportState
                                        >(
                                          builder: (context, state) {
                                            if (state
                                                is CreditReportLoadingState) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else if (state
                                                is CreditReportLoadedState) {
                                              return ListView.builder(
                                                itemCount:
                                                    state
                                                        .creditReportItems
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  final creditReport =
                                                      state
                                                          .creditReportItems[index];

                                                  return ContainersWithinScreens.creatingheadingThreeColumns(
                                                    context,
                                                    creditReport.ingredient,
                                                    creditReport.price
                                                        .toString(),
                                                    creditReport.materialUnit
                                                        .toString(),
                                                    AppColors.surfaceColor,
                                                  );
                                                },
                                              );
                                            }
                                            return Container();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: CommonStyle.contanersPadding,
                        ),
                        child: ContainersWithinScreens.createEmptyContainer(
                          context,
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: AppColors.containerColor3,
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Debit Report',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: textTheme.headlineSmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: AppColors.containerColor2,
                                  child: Column(
                                    children: [
                                      ContainersWithinScreens.creatingheadingThreeColumns(
                                        context,
                                        'Food Prepared',
                                        'Quantity',
                                        'Price',
                                        AppColors.containerColor,
                                      ),
                                      Expanded(
                                        child: BlocBuilder<
                                          DebitReportBloc,
                                          DebitReportState
                                        >(
                                          builder: (context, state) {
                                            if (state
                                                is DebitReportLoadingState) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else if (state
                                                is DebitReportLoadedState) {
                                              return ListView.builder(
                                                itemCount:
                                                    state
                                                        .debitReportItems
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  final debitReport =
                                                      state
                                                          .debitReportItems[index];
                                                  return ContainersWithinScreens.creatingheadingThreeColumns(
                                                    context,
                                                    debitReport.foodName,
                                                    debitReport.servingQuantity
                                                        .toString(),
                                                    '',
                                                    AppColors.surfaceColor,
                                                  );
                                                },
                                              );
                                            }
                                            return Container();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
