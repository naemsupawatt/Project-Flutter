// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:basicflutter/home.dart';
import 'package:basicflutter/page_account.dart';
import 'package:basicflutter/page_notify.dart';
import 'package:basicflutter/page_search.dart';
import 'package:basicflutter/page_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  var app = MyApp();
  WidgetsFlutterBinding.ensureInitialized();
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
  int index = 0;
  List _class = [
    Home(),
    SearchPage(),
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
