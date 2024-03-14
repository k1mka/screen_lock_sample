import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLayout extends StatefulWidget {
  const WebViewLayout({super.key});

  @override
  State<WebViewLayout> createState() => _WebViewLayoutState();
}

class _WebViewLayoutState extends State<WebViewLayout> {

  static const webViewLink = 'https://www.youtube.com/watch?v=o08YscncCTc&ab_channel=Wu-TangClan-Topic';

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
      Uri.parse(webViewLink),
    );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(controller: controller),
    );
  }
}
