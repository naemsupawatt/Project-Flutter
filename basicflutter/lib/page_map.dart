import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                  'https://www.google.com/maps?q=%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B8%9E%E0%B8%A2%E0%B8%B2%E0%B8%9A%E0%B8%B2%E0%B8%A5%E0%B9%83%E0%B8%81%E0%B8%A5%E0%B9%89%E0%B8%89%E0%B8%B1%E0%B8%99&rlz=1C1CHBD_enTH954TH954&um=1&ie=UTF-8&sa=X&ved=2ahUKEwivz8jP9uj1AhWRyzgGHQPUDkcQ_AUoAXoECAIQAw',
            ),
            Container(
              width: double.infinity,
              height: 95,
              color: Colors.white,
              child: AppBar(
                centerTitle: true,
                title: Text("ตำแหน่งโรงพยาบาล"),
                backgroundColor: Color.fromRGBO(30, 194, 165, 100),
              ),
            ),
          ],
        ));
  }
}
