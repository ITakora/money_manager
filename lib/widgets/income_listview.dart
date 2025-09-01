import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/income_model.dart';

class IncomeListview extends StatelessWidget {
  const IncomeListview({super.key, required this.data});

  final List<IncomeModel> data;


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {

          final currencyFormat = NumberFormat.currency(locale: 'id',
              symbol: 'Rp ', decimalDigits: 0);

          final moneyFormatted = currencyFormat.format(int.parse(data[index].money));
          DateTime parsedDate = DateTime.parse(data[index].date);
          String dateFormatted = DateFormat("dd MMM yyyy").format(parsedDate);
          DateTime getTodayTime = DateTime.now();
          String dateTodayFormatted = DateFormat("dd MMM yyyy").format(getTodayTime);

            return SizedBox(
              height: 90,
              width: double.infinity,
              child: Card(
                color: Color(0xFF9FE1E1),
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
                            moneyFormatted,
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${data[index].category?.name.replaceAll('_', ' ')} ${data[index]
                                .category?.unicodeIcon} ",
                            style: GoogleFonts.poppins(fontSize: 13),
                          ),
                        )
                      ],
                    ),


                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(dateFormatted == dateTodayFormatted ? "Hari ini" : dateFormatted, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),),
                        )

                  ],
                ),
              ),
            );}
      ),
    );
  }
}
