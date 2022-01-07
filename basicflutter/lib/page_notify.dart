import 'package:flutter/material.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("การแจ้งเตือน"),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
    );
  }
}
