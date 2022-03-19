import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PageMap extends StatefulWidget {
  const PageMap({Key? key}) : super(key: key);
  @override
  _PageMapState createState() => _PageMapState();
}

class _PageMapState extends State<PageMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'https://www.google.com/maps/search/โรงพยาบาลใกล้ฉัน/',
            ),
            Container(
              width: double.infinity,
              height: 95,
              color: Colors.white,
              child: AppBar(
                centerTitle: true,
                title: Text(
                  "ตำแหน่งโรงพยาบาล",
                  style: TextStyle(
                    fontFamily: 'Prompt',
                    fontSize: 18,
                  ),
                ),
                backgroundColor: Color.fromRGBO(30, 194, 165, 100),
              ),
            ),
          ],
        ));
  }
}
