class Todo {
  String title;
  bool isCompleted;
  bool isFavourite;

  Todo({
    required this.title,
    this.isCompleted = false,
    this.isFavourite = false,
  });
}
