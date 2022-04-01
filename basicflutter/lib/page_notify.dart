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
        child: Center(
            child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(186, 186, 186, 1))),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 340,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'จันทร์ 22:00 น.',
                                style: TextStyle(
                                    fontFamily: 'Prompt',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(57, 137, 123, 1)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'เตือนการใช้ยา : ',
                                    style: TextStyle(
                                        fontFamily: 'Prompt',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 79, 79, 79)),
                                  ),
                                  Text(
                                    'Amoxicillin',
                                    style: TextStyle(
                                        fontFamily: 'Prompt',
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ข้อความที่แจ้งเตือน : ',
                                    style: TextStyle(
                                        fontFamily: 'Prompt',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 79, 79, 79)),
                                  ),
                                  Text(
                                    'ก่อนนอน 1 เม็ด',
                                    style: TextStyle(
                                        fontFamily: 'Prompt',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 79, 79, 79)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 30,
                                ),
                                onPressed: () {
                                  //ลบเวลาทิ้ง
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.all(15.0),
                width: 340,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(186, 186, 186, 1))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'จันทร์ 22:00 น.',
                      style: TextStyle(
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromRGBO(57, 137, 123, 1)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'เตือนการใช้ยา : ',
                          style: TextStyle(
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromARGB(255, 79, 79, 79)),
                        ),
                        Text(
                          'Amoxicillin',
                          style: TextStyle(
                              fontFamily: 'Prompt',
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'ข้อความที่แจ้งเตือน : ',
                          style: TextStyle(
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromARGB(255, 79, 79, 79)),
                        ),
                        Text(
                          'ก่อนนอน 1 เม็ด',
                          style: TextStyle(
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromARGB(255, 79, 79, 79)),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ],
        )),
      ),
    );
  }
}
