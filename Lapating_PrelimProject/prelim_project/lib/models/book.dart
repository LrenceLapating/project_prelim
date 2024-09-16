class Book {
  final String title;
  final String author;
  final String isbn;

  Book(this.title, this.author, this.isbn);

  @override
  String toString() => 'Book(title: $title, author: $author, ISBN: $isbn)';
}
