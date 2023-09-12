import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/widgets/sheets/home_sheets/thank_you_sheet.dart';
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
              context.read<CustomNavbarCubit>().pay();
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height - 102,
                    alignment: Alignment.topCenter,
                    child: const ThankYouSheet(),
                  ),
              );
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
