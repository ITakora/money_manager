enum ExpenseTypes {
  Makanan,
  Kendaraan,
  Hobi,
  Movies;

  String get unicodeIcon {
    switch (this) {
      case ExpenseTypes.Makanan:
        return '🍚';
      case ExpenseTypes.Kendaraan:
        return '🚗';
      case ExpenseTypes.Hobi:
        return '🎨';
      case ExpenseTypes.Movies:
        return '🎥';
    }
  }
}
