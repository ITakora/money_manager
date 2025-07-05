import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeExpenseCard extends StatelessWidget {
  const IncomeExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 90,
          width: 185,
          child: Card(
              color: Color(0xFF9FE1E1),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Income",
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Rp.300.000",
                      style: GoogleFonts.poppins(fontSize: 17),
                    )
                  ],
                ),
              )),
        ),
        SizedBox(
          height: 90,
          width: 185,
          child: Card(
            color: Color(0xFFEA6C84),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expense",
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Rp.300.000",
                    style: GoogleFonts.poppins(fontSize: 17),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
