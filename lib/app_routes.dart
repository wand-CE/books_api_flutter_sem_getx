import 'package:books_api_flutter_sem_getx/views/book_detail_page.dart';
import 'package:books_api_flutter_sem_getx/views/buy_book_page.dart';
import 'package:books_api_flutter_sem_getx/views/home_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const bookDetailPage = '/bookDetailPage';
  static const buyBookPage = '/buyBookPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => Homepage(),
      bookDetailPage: (BuildContext context) => BookDetailPage(),
      buyBookPage: (BuildContext context) => BuyBookPage(),
    };
  }
}
