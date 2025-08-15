import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/providers/expend_field_provider.dart';
import 'package:money_manager/widgets/expend_field_widget.dart';

class ExpenseFieldScreen extends ConsumerWidget {
  const ExpenseFieldScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expendFieldWidget = ExpendFieldWidget();
    final formKey = expendFieldWidget.getFormKey();

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              final state = ref.read(expendFieldProvider);
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
      body: expendFieldWidget,
    );
  }
}
