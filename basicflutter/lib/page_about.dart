import 'package:flutter/material.dart';

class PageAbout extends StatefulWidget {
  const PageAbout({Key? key}) : super(key: key);

  @override
  _PageAboutState createState() => _PageAboutState();
}

class _PageAboutState extends State<PageAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "เกี่ยวกับโปรแกรม",
            style: TextStyle(
              fontFamily: 'Prompt',
              fontSize: 18,
            ),
          ),
          backgroundColor: Color.fromRGBO(30, 194, 165, 100),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  height: 120,
                ),
              ),
              Container(
                child: Image.asset("image/logo.png"),
                height: MediaQuery.of(context).size.height * .1,
              ),
              Container(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Container(
                child: Text(
                  "Medicine Usage with QR Code",
                  style: TextStyle(
                    color: Color.fromRGBO(116, 116, 116, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Container(
                child: Text(
                  "V.1.0",
                  style: TextStyle(
                    color: Color.fromRGBO(116, 116, 116, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
