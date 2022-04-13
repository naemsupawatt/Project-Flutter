import 'package:basicflutter/googleauth.dart';
import 'package:basicflutter/home.dart';
import 'package:basicflutter/page_root_app.dart';
import 'package:basicflutter/page_account.dart';
import 'package:basicflutter/page_detail.dart';
import 'package:basicflutter/page_login.dart';
import 'package:basicflutter/page_notify.dart';
import 'package:basicflutter/page_search.dart';
import 'package:basicflutter/page_setting.dart';
import 'package:basicflutter/services/local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final FirebaseFirestore UserCollection = FirebaseFirestore.instance;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationService.initilize();
    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        print(event);
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      print(event);
    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print(event);
    });
    getTokenNotify();
  }

  void getTokenNotify() async {
    String? token = await firebaseMessaging.getToken();
    print(token);
    UserCollection.collection('Users')
        .doc(userid)
        .update({
          "tokenNotify": token,
        })
        .then((value) {})
        .catchError((error) => print("Failed to add user: $error"));
  }

  int index = 0;
  List _class = [
    Home(),
    PageSearch(),
    PageLogin(),
    NotifyPage(),
    SettingPage(),
  ];
  var bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_outlined),
      label: ' ',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.search_outlined),
      label: ' ',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person_outlined),
      label: ' ',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.notifications_outlined),
      label: ' ',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.settings_outlined),
      label: ' ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _class[index],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 1,
        unselectedFontSize: 1,
        onTap: (_index) {
          index = _index;
          setState(() {});
        },
        selectedItemColor: Color.fromRGBO(22, 150, 127, 1),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
