import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ExpendFieldWidget extends StatefulWidget {
  const ExpendFieldWidget({super.key});

  @override
  State<ExpendFieldWidget> createState() => _ExpendFieldWidgetState();
}

class _ExpendFieldWidgetState extends State<ExpendFieldWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future selectDate() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    if (dateTime != null) {
      setState(() {
        textController.text = dateFormat.format(dateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13, top: 15),
          child: Row(
            children: [
              Text(
                "Date",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                  child: TextFormField(
                controller: textController,
                onTap: () {
                  selectDate();
                },
                readOnly: true,
                enableInteractiveSelection: false,
                inputFormatters: [ThousandsFormatter()],
                decoration:
                    InputDecoration(contentPadding: EdgeInsets.only(left: 4)),
                style: TextStyle(fontSize: 18),
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            children: [
              Text(
                "Total",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                  child: TextFormField(
                enableInteractiveSelection: false,
                inputFormatters: [ThousandsFormatter()],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 4), prefixText: "Rp"),
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 13, top: 10),
          child: Row(
            children: [
              Text(
                "Category",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
