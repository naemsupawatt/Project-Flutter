import 'package:basicflutter/page_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import './services/local_notifications.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  var textEditController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "การแจ้งเตือน",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        '17:35 น.',
                        style: TextStyle(
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromRGBO(57, 137, 123, 1)),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'เตือนการใช้ยา : พาราเซตามอล',
                            style: TextStyle(
                                fontFamily: 'Prompt',
                                fontSize: 16,
                                color: Color.fromARGB(255, 36, 36, 36)),
                          ),
                          Text(
                            'ข้อความที่แจ้งเตือน : ก่อนนอน 1 เม็ด',
                            style: TextStyle(
                                fontFamily: 'Prompt',
                                fontSize: 16,
                                color: Color.fromARGB(255, 36, 36, 36)),
                          )
                        ],
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                          color: Color.fromARGB(255, 85, 85, 85),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
