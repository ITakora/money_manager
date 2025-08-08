import 'package:flutter/material.dart';
import 'package:money_manager/widgets/expend_field_widget.dart';

class ExpenseFieldScreen extends StatelessWidget {
  const ExpenseFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xFFFEFEFE),
            child: Icon(
              Icons.done,
              color: Colors.black,
            ),
          ),
        ),
        body: ExpendFieldWidget());
  }
}
