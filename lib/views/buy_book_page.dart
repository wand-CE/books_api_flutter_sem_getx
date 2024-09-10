import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/buy_book_view_controller.dart';

class BuyBookPage extends StatefulWidget {
  const BuyBookPage({super.key});

  @override
  State<BuyBookPage> createState() => _BuyBookPageState();
}

class _BuyBookPageState extends State<BuyBookPage> {
  late BuyBookViewController _buyBookViewController;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final url = args?['url'];
    final bookTitle = args?['bookTitle'] ?? 'Livro';

    _buyBookViewController = BuyBookViewController(url);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$bookTitle',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _buyBookViewController.reloadPage,
          ),
        ],
      ),
      body: WebViewWidget(controller: _buyBookViewController.webViewController),
    );
  }
}
