import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/enums/expense_enum.dart';
import 'package:money_manager/enums/income_enum.dart';
import 'package:money_manager/providers/income_field_provider.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class IncomeFieldWidget extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  IncomeFieldWidget({super.key, required this.formKey});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future selectDate() async {
      DateTime? dateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2030));

      if (dateTime != null) {
        DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        _textController.text =
            dateFormat.format(dateTime); // Update the text field
        ref.read(incomeFieldProvider.notifier).setDate(
            dateFormat.format(dateTime)); // Update the date in the provider
      }
    }

    List<DropdownMenuItem<IncomeTypes>> dropdownMenuEntries =
    IncomeTypes.values.map((IncomeTypes category) {
      String displayName = category.name.replaceAll('_', ' ');


      return DropdownMenuItem<IncomeTypes>(
        value: category,
        child: Text(
          "${category.unicodeIcon} $displayName",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      );
    }).toList();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 10, right: 13),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                  controller: _textController,
                  onTap: () {
                    selectDate();
                  },
                  readOnly: true,
                  enableInteractiveSelection: false,
                  inputFormatters: [ThousandsFormatter()],
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 3, top: 10),
                      prefixIcon: Icon(Icons.calendar_today)),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    ref
                        .read(incomeFieldProvider.notifier)
                        .setMoney(value.replaceAll(RegExp(r'[^0-9]'), ''));
                  },
                  enableInteractiveSelection: false,
                  inputFormatters: [ThousandsFormatter()],
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 4),
                      prefixText: "Rp"),
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 10, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                    items: dropdownMenuEntries,
                    onChanged: (value) {
                      ref.read(incomeFieldProvider.notifier).setCategory(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 13, top: 24),
              child: TextField(
                maxLines: null,
                minLines: 1,
                decoration: InputDecoration(
                    hintText: "Description", hintStyle: GoogleFonts.poppins()),
              ))
        ],
      ),
    );
  }
}
