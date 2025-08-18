import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80, bottom: 20),
      child: Center(
          child: Column(
        children: [
          Text(
            "Rp 0",
            style:
                GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Total Balance")
        ],
      )),
    );
  }
}
