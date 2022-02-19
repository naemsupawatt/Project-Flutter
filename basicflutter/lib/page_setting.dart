import 'package:basicflutter/page_about.dart';
import 'package:basicflutter/page_login.dart';
import 'package:basicflutter/page_notify.dart';
import 'package:basicflutter/page_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

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
        title: Text(
          "ตั้งค่า",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                    leading: Icon(
                      Icons.person_outline,
                      size: 28,
                    ),
                    title: Text(
                      "ข้อมูลของฉัน",
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageLogin()))),
              ),
              Card(
                child: ListTile(
                    leading: Icon(
                      Icons.notifications_outlined,
                      size: 28,
                    ),
                    title: Text(
                      "การแจ้งเตือน",
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotifyPage()))),
              ),
              Card(
                child: ListTile(
                    leading: Icon(
                      Ionicons.alert_circle_outline,
                      size: 28,
                    ),
                    title: Text(
                      "เกี่ยวกับโปรแกรม",
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageAbout()))),
              ),
              Card(
                child: ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      size: 28,
                    ),
                    title: Text(
                      "นโยบายความเป็นส่วนตัว",
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PagePolicy()))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
