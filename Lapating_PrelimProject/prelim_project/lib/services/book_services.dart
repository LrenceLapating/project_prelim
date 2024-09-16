import '../models/book.dart';

class BookService {
  final List<Book> _books = [];


  void addBook(String title, String author, String isbn) {
    final book = Book(title, author, isbn);
    _books.add(book);
    print('Book added: $book');
  }

  void listBooks() {
    if (_books.isEmpty) {
      print('\nNo books available.');
    } else {
      print('\nListing books:');
      for (var book in _books) {
        print(book);
      }
    }
  }

  void deleteBook(String isbn) {
    final bookToDelete = _books.firstWhere(
      (book) => book.isbn == isbn,
      orElse: () => Book('', '', ''),
    );

    if (bookToDelete.isbn.isEmpty) {
      print('\nBook not found.');
    } else {
      _books.remove(bookToDelete);
      print('Book deleted: ${bookToDelete.title}');
    }
  }

 
  void searchBook(String title) {
    final foundBooks = _books.where((book) => book.title.toLowerCase().contains(title.toLowerCase())).toList();

    if (foundBooks.isEmpty) {
      print('No books found matching the title "$title".');
    } else {
      print('Books found:');
      for (var book in foundBooks) {
        print(book);
      }
    }
  }
}
