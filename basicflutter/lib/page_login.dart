import 'package:basicflutter/googleauth.dart';
import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ข้อมูลส่วนตัว"),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Container(
          child: Column(
        children: [
          Image.network(imageUrl),
          Text(name),
          Text(email),
          Text(userid),
          TextButton(
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return PageLogin();
                }), ModalRoute.withName('/'));
              },
              child: Text("Logout"))
        ],
      )),
    );
  }
}
