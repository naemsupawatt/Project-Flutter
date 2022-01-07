import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("ค้นหาข้อมูลยา"),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "ค้นหาด้วยชื่อยา",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
