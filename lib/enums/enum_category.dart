enum Category { food, transport, hobbies, movies }

String getCategoryDisplayName(Category category) {
  switch (category) {
    case Category.food:
      return 'Food';
    case Category.transport:
      return 'Transport';
    case Category.hobbies:
      return 'Hobbies';
    case Category.movies:
      return 'Movies';
  }
}
