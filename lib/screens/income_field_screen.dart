import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/providers/income_field_provider.dart';
import 'package:money_manager/widgets/income_field_widget.dart';

class IncomeFieldScreen extends ConsumerWidget {
  const IncomeFieldScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomeFieldWidget = IncomeFieldWidget();
    final formKey = incomeFieldWidget.getFormKey();
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              final state = ref.read(incomeFieldProvider);
              Navigator.pop(context, state);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill all required fields')));
            }
          },
          backgroundColor: Color(0xFFFEFEFE),
          child: Icon(
            Icons.done,
            color: Colors.black,
          ),
        ),
      ),
      body: IncomeFieldWidget(),
    );
  }
}
