enum IncomeTypes {
  Gaji,
  Uang_Jajan,
  Bonus;

  String get unicodeIcon {
    switch (this) {
      case IncomeTypes.Gaji:
        return '💰';
      case IncomeTypes.Uang_Jajan:
        return '🤑';
      case IncomeTypes.Bonus:
        return '💸';
    }
  }
}