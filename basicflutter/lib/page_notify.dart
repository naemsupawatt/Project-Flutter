import 'package:basicflutter/page_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import './services/local_notifications.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationService.initilize();
  }

  var textEditController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
          height: 50,
          width: 250,
          child: TextButton(
              onPressed: () {
                LocalNotificationService.showNotificationOnForeground();
              },
              child: Text(
                "TEST",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Prompt',
                  fontSize: 15,
                ),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.grey))),
    ));
  }
}
