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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text("Create account", style: TextStyle(fontSize: 12)),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.login),
                label: Text("Login", style: TextStyle(fontSize: 12)),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
