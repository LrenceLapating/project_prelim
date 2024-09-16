import 'package:riverpod/riverpod.dart';
import 'services/book_services.dart';
import 'dart:io';


final bookServiceProvider = Provider((ref) => BookService());

void main() {
  final container = ProviderContainer();
  final bookService = container.read(bookServiceProvider);

  print('Welcome to the Library Management System!');

  while (true) {
    print('\nSelect an option:');
    print('1. Add Book');
    print('2. List Books');
    print('3. Delete Book');
    print('4. Search Book by Title');
    print('5. Exit');

    print("");
    var choice = stdin.readLineSync();
    print("");

    switch (choice) {
      case '1':
        print('Enter title:');
        var title = stdin.readLineSync() ?? '';
        print('Enter author:');
        var author = stdin.readLineSync() ?? '';
        print('Enter ISBN:');
        var isbn = stdin.readLineSync() ?? '';
        bookService.addBook(title, author, isbn);
        break;

      case '2':
        bookService.listBooks();
        break;

      case '3':
        print('Enter ISBN of the book to delete:');
        var isbn = stdin.readLineSync() ?? '';
        bookService.deleteBook(isbn);
        break;

      case '4':
        print('Enter the title of the book to search:');
        var title = stdin.readLineSync() ?? '';
        bookService.searchBook(title);
        break;

      case '5':
        print('Exiting...');
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
