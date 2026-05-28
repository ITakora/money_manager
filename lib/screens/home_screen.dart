import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/providers/all_provider_data.dart';
import 'package:money_manager/providers/db_income_provider.dart';
import 'package:money_manager/providers/notification_provider.dart';
import 'package:money_manager/providers/today_provider_data.dart';
import 'package:money_manager/screens/money_field_screen.dart';
import 'package:money_manager/utils/dataMonthlyNowFilter.dart';
import 'package:money_manager/utils/notification_service.dart';
import 'package:money_manager/widgets/balance_widget.dart';
import 'package:money_manager/widgets/income_expense_card.dart';
import 'package:money_manager/widgets/today_list_widget.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../providers/db_expense_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  @override
  void initState() {
    super.initState();

    ref.read(trackMoneyExpenseProvider.notifier).loadAllDbExpense();
    ref.read(trackMoneyIncomeProvider.notifier).loadAllDbIncome();
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Enable Notifications?',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Text(
          'Reminder untuk makan siang dan makan malam akan muncul setiap hari pukul 12:00 dan 20:00',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child:
                Text('Tolak', style: GoogleFonts.poppins(color: Colors.black)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);

              final granted = await NotificationService().requestPermissions();

              if (!mounted) return;

              if (granted) {
                await ref
                    .read(notificationEnabledProvider.notifier)
                    .toggleNotifications();

                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications enabled!')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Permission denied by system.')),
                );
              }
            },
            child:
                Text('Terima', style: GoogleFonts.poppins(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final getTodayData = ref.watch(todayMoneyProvider);
    final getAllData = ref.watch(allMoneyProvider);
    final isNotificationEnabled = ref.watch(notificationEnabledProvider);

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () async {
            await pushScreenWithoutNavBar(context, MoneyFieldScreen());
          },
          backgroundColor: const Color(0xFFFEFEFE),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF9F8FA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              BalanceWidget(
                expenseData: getAllData.allExpenses,
                incomeData: getAllData.allIncomes,
              ),
              IncomeExpenseCard(
                expenseData: DataMonthlyNowFilter.filterCurrentMonthExpense(
                    getAllData.allExpenses),
                incomeData: DataMonthlyNowFilter.filterCurrentMonthIncome(
                    getAllData.allIncomes),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "Hari ini",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        if (isNotificationEnabled) {
                          ref
                              .read(notificationEnabledProvider.notifier)
                              .toggleNotifications();
                        } else {
                          _showNotificationDialog();
                        }
                      },
                      icon: Icon(
                        size: 40,
                        isNotificationEnabled
                            ? Icons.notifications_active
                            : Icons.notifications_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TodayListWidget(
              expenseData: getTodayData.expenses,
              incomeData: getTodayData.incomes,
            ),
          ),
        ],
      ),
    );
  }
}
