import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("ตั้งค่า"),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "This is Text Widget",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          Image(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2019/12/08/19/50/winter-4682051_960_720.jpg')),
          Text("This is two widget")
        ],
      )),
    );
  }
}
