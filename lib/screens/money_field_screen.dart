import 'package:flutter/material.dart';
import 'package:money_manager/screens/expense_field_screen.dart';
import 'package:money_manager/screens/income_field_screen.dart';

class MoneyFieldScreen extends StatelessWidget {
  const MoneyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                child: Text("Pengeluaran"),
              ),
              Tab(
                child: Text("Pendapatan"),
              )
            ]),
            centerTitle: true,
            elevation: 5,
            backgroundColor: Color(0xFFFEFEFE),
          ),
          body: TabBarView(
              children: [ExpenseFieldScreen(), IncomeFieldScreen()])),
    );
  }
}
