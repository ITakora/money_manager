import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SizedBox(
        height: 90,
        width: double.infinity,
        child: Card(
          color: Color(0xFFFEFEFE),
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Makan Siang",
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Text(
                      "Makanan",
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Text(
                      "Rp. 18.000",
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text("Aug 28"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
