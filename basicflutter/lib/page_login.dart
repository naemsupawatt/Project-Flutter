import 'package:basicflutter/googleauth.dart';
import 'package:basicflutter/home.dart';
import 'package:basicflutter/main.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(imageUrl)),
              SizedBox(
                height: 40,
              ),
              const Divider(
                color: Color.fromRGBO(203, 203, 203, 100),
                height: 1,
                thickness: 2,
                indent: 25,
                endIndent: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "ชื่อ - นามสกุล                             " + name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //Text(email),
              //Text(userid),
              SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color.fromRGBO(203, 203, 203, 100),
                height: 1,
                thickness: 2,
                indent: 25,
                endIndent: 25,
              ),
              SizedBox(
                height: 300,
              ),

              SizedBox(
                  height: 50,
                  width: 250,
                  child: TextButton(
                      onPressed: () {
                        signOutGoogle();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return Menu();
                        }), ModalRoute.withName('/'));
                      },
                      child: Text(
                        "LOGOUT",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.grey))),
            ],
          ),
        ),
      ),
    );
  }
}

class PageMenu {}
