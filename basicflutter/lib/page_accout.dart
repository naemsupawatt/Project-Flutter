import 'package:basicflutter/page_login.dart';
import 'package:basicflutter/page_register.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("เข้าสู่ระบบ"),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 200, 50, 0),
        child: SingleChildScrollView(
          //ป้องกัน button overflow
          child: Column(
            children: [
              Image.asset(
                "assets/profile-user.png",
                width: 49,
                height: 49,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  label: Text("LOGIN",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context, //ลิ้งไปยังหน้าต่อไปยังหน้า PageLogin
                        MaterialPageRoute(builder: (context) {
                      return PageLogin();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(30, 194, 165, 100),
                      minimumSize: Size(222, 48)),
                ),
              ),
              const SizedBox(),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PageRegister();
                  }));
                },
                child: const Text(
                  'Create account',
                  style: TextStyle(
                      color: Color.fromRGBO(19, 143, 121, 100),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
