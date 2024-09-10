import 'package:webview_flutter/webview_flutter.dart';

class BuyBookViewController {
  late WebViewController webViewController;

  final String url;

  BuyBookViewController(this.url) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  void reloadPage() => webViewController.reload();
}
