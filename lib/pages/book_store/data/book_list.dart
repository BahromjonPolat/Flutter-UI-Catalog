
import 'package:flutter_ui/pages/book_store/model/book.dart';
String description = "«Тафсири Ҳилол» - бутун оламга мударрис бўлган буюк уламолар юрти - Мовароуннаҳр диёрида ёзилган энг янги тафсирдир. Замонамизнинг забардаст олимларидан бири шайх Муҳаммад Содиқ Муҳаммад Юсуф ҳазратларининг ушбу тафсирлари ўзининг содда ва равон тили, теран ва дақиқ услуби билан ажралиб турувчи шоҳ асардир. «Тафири Ҳилол» мўътабар тафсирларнинг анъаналарига содиқ қолган ҳолда, бугунги кун китобхонининг савияси, дунёқараши ва эҳтитёжларини ҳам ҳисобга олиб ёзилган бўлиб, ўқувчини Қуръони карим маъноларининг битмас-туганмас ҳикматларига ошно этади.";

List<Book> getBooks() {
  List<Book> books = [];
  books.add(new Book("Tafsiri Hilol", "Shayx Muhammad Sodiq Muhammad Yusuf", "https://hilolnashr.uz/image/cache/catalog/MSMY/tafsir-1-web-250x375.jpg"));
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