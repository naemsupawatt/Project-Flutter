// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:basicflutter/home.dart';
import 'package:basicflutter/page_account.dart';
import 'package:basicflutter/page_detail.dart';
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

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> backroundHandler(RemoteMessage message) async {
  print(" This is message from background");
  print(message.notification!.title);
  print(message.notification!.body);
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backroundHandler);
  var app = MyApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("Medicine Usage with QR Code"),
      home: Menu(), // ให้หน้า Menu เป็นหน้าแรก
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Menu> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationService.initilize();
    getTokenNotify();
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
  }

  void getTokenNotify() async {
    String? token = await firebaseMessaging.getToken();
    print(token);
  }

  int index = 0;
  List _class = [
    Home(),
    PageSearch(),
    AccountPage(),
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
