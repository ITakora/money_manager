enum ExpenseType {
  Food,
  Transport,
  Hobbies,
  Movies;

  String get unicodeIcon {
    switch (this) {
      case ExpenseType.Food:
        return '🍚';
      case ExpenseType.Transport:
        return '🚗';
      case ExpenseType.Hobbies:
        return '🎨';
      case ExpenseType.Movies:
        return '🎥';
    }
  }
}
