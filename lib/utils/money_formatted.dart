import 'package:intl/intl.dart';

class MoneyFormatted {
  static String formatCurrencyToIDR(String amount) {
    final stringToInt = int.parse(amount);

    final currencyFormat =
        NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(stringToInt);
  }
}
