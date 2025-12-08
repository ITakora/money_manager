import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/providers/db_expense_provider.dart';
import 'package:money_manager/utils/date_formatted.dart';
import 'package:money_manager/utils/money_formatted.dart';

class ExpenseListview extends ConsumerWidget {
  const ExpenseListview({super.key, required this.data});

  final List<ExpenseModel> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    data.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return Flexible(
      child: ListView.builder(
          padding: EdgeInsets.only(left: 10, right: 10, top: 3),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Slidable(
                endActionPane: ActionPane(motion: ScrollMotion(), children: [
                  SlidableAction(
                      onPressed: (context) {
                        ref
                            .watch(trackMoneyExpenseProvider.notifier)
                            .deleteExpense(data[index].id);
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
                                MoneyFormatted.formatCurrencyToIDR(
                                    data[index].money),
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                            data[index].description.isEmpty
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      data[index].description,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "${data[index].category?.name} ${data[index].category?.unicodeIcon} ",
                                style: GoogleFonts.poppins(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            DateFormatted.getDateFormatted(data[index].date) ==
                                    DateFormatted.getTodayFormatted()
                                ? "Hari Ini"
                                : DateFormatted.getDateFormatted(
                                    data[index].date),
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
