import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Card(
          color: Color(0xFFFEFEFE),
          elevation: 3,
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
