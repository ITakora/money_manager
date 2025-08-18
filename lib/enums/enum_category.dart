enum Category {
  Food,
  Transport,
  Hobbies,
  Movies;

  String get unicodeIcon {
    switch (this) {
      case Category.Food:
        return '🍚';
      case Category.Transport:
        return '🚗';
      case Category.Hobbies:
        return '🎨';
      case Category.Movies:
        return '🎥';
    }
  }
}
