import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/providers/monthly_provider.dart';
import 'package:money_manager/utils/date_formatted.dart';
import 'package:money_manager/widgets/chart_widget.dart';
import 'package:money_manager/widgets/expense_incomes_history_list.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final List listDropdown = ref.watch(listDropdownProvider);
    final filterData = ref.watch(filterMonthlyProvider);
    final dropdownStateNotifier = ValueNotifier<DateTime?>(
        listDropdown.contains(selectedMonth)
            ? selectedMonth
            : (listDropdown.isNotEmpty ? listDropdown.first : selectedMonth));

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: ChartWidget(dataExpense: filterData.expenses),
          ),
          const SizedBox(height: 15),
          DropdownButtonHideUnderline(
              child: DropdownButton2(
            valueListenable: dropdownStateNotifier,
            onChanged: (DateTime? newValue) {
              if (newValue != null) {
                ref.read(selectedMonthProvider.notifier).state = newValue;
              }
            },
            items: listDropdown.map<DropdownItem<DateTime>>((date) {
              return DropdownItem<DateTime>(
                value: date,
                child: Text(
                  DateFormatted.getMonthFormatted(date.toIso8601String()),
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              );
            }).toList(),
            dropdownStyleData: DropdownStyleData(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8))),
          )),
          SizedBox(height: 10),
          Expanded(
            child: ExpenseIncomesHistoryList(
                dataIncome: filterData.incomes,
                dataExpense: filterData.expenses),
          )
        ],
      ),
    );
  }
}
