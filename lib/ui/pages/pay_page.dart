import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key, required this.url});

  final String url;

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('https://play.google.com/store/apps/details?id=com.bearcorner_mobile')) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
