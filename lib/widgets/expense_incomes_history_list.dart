import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/models/expense_income_model.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_expense_provider.dart';
import 'package:money_manager/providers/db_income_provider.dart';
import 'package:money_manager/utils/date_formatted.dart';
import 'package:money_manager/utils/money_formatted.dart';

class ExpenseIncomesHistoryList extends ConsumerWidget {
  const ExpenseIncomesHistoryList(
      {super.key, required this.dataIncome, required this.dataExpense});

  final List<IncomeModel> dataIncome;
  final List<ExpenseModel> dataExpense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ExpenseIncome> combinedList = [...dataIncome, ...dataExpense];
    combinedList.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return ListView.builder(
      padding: EdgeInsets.only(left: 8, right: 8, top: 7, bottom: 70),
      itemCount: combinedList.length,
      itemBuilder: (context, index) {
        final data = combinedList[index];

        if (data is IncomeModel) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Slidable(
                endActionPane: ActionPane(motion: ScrollMotion(), children: [
                  SlidableAction(
                      onPressed: (context) {
                        ref
                            .watch(trackMoneyIncomeProvider.notifier)
                            .deleteIncome(data.id);
                      },
                      icon: Icons.delete,
                      backgroundColor: Colors.red,
                      label: 'Delete',
                      borderRadius: BorderRadius.circular(8))
                ]),
                child: SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: Card(
                    color: Color(0xFF9FE1E1),
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                MoneyFormatted.formatCurrencyToIDR(data.money),
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "${data.category?.name.replaceAll('_', ' ')} ${data.category?.unicodeIcon} ",
                                style: GoogleFonts.poppins(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            DateFormatted.getDateFormatted(data.date) ==
                                    DateFormatted.getTodayFormatted()
                                ? "Hari Ini"
                                : DateFormatted.getDateFormatted(data.date),
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        } else if (data is ExpenseModel) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Slidable(
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                    onPressed: (context) {
                      ref
                          .watch(trackMoneyExpenseProvider.notifier)
                          .deleteExpense(data.id);
                    },
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    label: 'Delete',
                    borderRadius: BorderRadius.circular(8))
              ]),
              child: SizedBox(
                height: 90,
                width: double.infinity,
                child: Card(
                  color: Color(0xFFEA6C84),
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              MoneyFormatted.formatCurrencyToIDR(data.money),
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "${data.category?.name} ${data.category?.unicodeIcon} ",
                              style: GoogleFonts.poppins(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          DateFormatted.getDateFormatted(data.date) ==
                                  DateFormatted.getTodayFormatted()
                              ? "Hari Ini"
                              : DateFormatted.getDateFormatted(data.date),
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
