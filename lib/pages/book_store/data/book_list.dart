
import 'package:flutter_ui/pages/book_store/model/book.dart';
String a = "https://images.unsplash.com/photo-1511108690759-009324a90311?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80";
List<Book> getBooks() {
  List<Book> books = [];
  books.add(new Book("Tafsiri Hilol", "Shayx Muhammad Sodiq Muhammad Yusuf", a));
  books.add(new Book("Shaytanat", "Tohir Malik", "default"));
  books.add(new Book("Halqa", "Akrom MALIK", "default"));
  books.add(new Book("Duo olgan kelinchak", "Erkin Malik", "default"));
  books.add(new Book("Imomning maniken qizi", "Amina Shenliko`g`li", "default"));
  books.add(new Book("To`ydan keyin ham muhabat bo`lsin", "Sema Marashli", "default"));
  books.add(new Book("O`gay ona", "Ahmad Lutfi Qozonchi", "default"));
  // books.add(new Book("", "", "default"));
  // books.add(new Book("", "", "default"));

  return books;
}