import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/providers/expend_field_provider.dart';
import 'package:money_manager/widgets/expend_field_widget.dart';

class ExpenseFieldScreen extends ConsumerStatefulWidget {
  const ExpenseFieldScreen({super.key});

  @override
  ConsumerState<ExpenseFieldScreen> createState() => _ExpenseFieldScreenState();
}

class _ExpenseFieldScreenState extends ConsumerState<ExpenseFieldScreen> {
  final expendFieldWidget = ExpendFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            final formKey = expendFieldWidget.getFormKey();
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
