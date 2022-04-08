import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          "https://drive.google.com/file/d/1BZBvngsFht5G-D-7HYiHemFfNxkcECGu/view?usp=sharing",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
