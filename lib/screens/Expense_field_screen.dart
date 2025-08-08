import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ExpenseFieldScreen extends StatelessWidget {
  const ExpenseFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

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
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                    child: TextFormField(
                  inputFormatters: [ThousandsFormatter()],
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 6),
                      prefixText: "Rp"),
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
