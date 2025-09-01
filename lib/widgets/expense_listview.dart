import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/models/expense_model.dart';

class ExpenseListview extends StatelessWidget {
  const ExpenseListview({super.key, required this.data});

  final List<ExpenseModel> data;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 10, right: 10, top: 3),
        itemCount: data.length,
        itemBuilder: (context, index) => SizedBox(
            height: 90,
            width: double.infinity,
            child: Card(
              color: Color(0xFFEA6C84),
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Rp.${data[index].money}",
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "${data[index].category?.name} ${data[index].category?.unicodeIcon} ",
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
        ),
      );
  }
}
