import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/providers/db_expense_provider.dart';
import 'package:money_manager/providers/expense_field_provider.dart';
import 'package:money_manager/widgets/expense_field_widget.dart';

class ExpenseFieldScreen extends ConsumerStatefulWidget {
  const ExpenseFieldScreen({super.key});

  @override
  ConsumerState<ExpenseFieldScreen> createState() => _ExpenseFieldScreenState();
}

class _ExpenseFieldScreenState extends ConsumerState<ExpenseFieldScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void saveExpense() {
      if (formKey.currentState?.validate() ?? false) {
        final state = ref.watch(expendFieldProvider);
        Navigator.pop(context);
        ref.read(trackMoneyExpenseProvider.notifier).addExpense(state);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please fill all required fields')));
      }
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: saveExpense,
          backgroundColor: Color(0xFFFEFEFE),
          child: Icon(
            Icons.done,
            color: Colors.black,
          ),
        ),
      ),
      body: ExpenseFieldWidget(
        formKey: formKey,
      ),
    );
  }
}
