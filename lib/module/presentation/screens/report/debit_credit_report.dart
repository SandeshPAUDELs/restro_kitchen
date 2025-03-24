import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_bloc.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_events.dart';
import 'package:hive_project/module/presentation/bloc/report/credit_report/credit_report_state.dart';

class DebitCreditReport extends StatelessWidget {
  const DebitCreditReport({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CreditReportBloc>().add(LoadCreditReportEvents());
    return Scaffold(
      appBar: AppBar(title: Text('Debit Credit Report')),
      body: BlocBuilder<CreditReportBloc, CreditReportState>(
        builder: (context, state) {
          if (state is CreditReportLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CreditReportLoadedState) {
            return ListView.builder(
              itemCount: state.creditReportItems.length,
              itemBuilder: (context, index) {
                final creditReport = state.creditReportItems[index];
                return ListTile(
                  title: Text(creditReport.ingredient),
                  subtitle: Column(
                    children: [
                      Text(creditReport.price.toString()),
                      Text(creditReport.materialUnit.toString()),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
