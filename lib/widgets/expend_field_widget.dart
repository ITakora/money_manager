import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ExpendFieldWidget extends StatelessWidget {
  const ExpendFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                enableInteractiveSelection: false,
                inputFormatters: [ThousandsFormatter()],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 6), prefixText: "Rp"),
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: Row(
            children: [
              Text(
                "Category",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
