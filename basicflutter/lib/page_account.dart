import 'package:basicflutter/ConnectFirebase.dart';
import 'package:basicflutter/home.dart';
import 'package:basicflutter/page_login.dart';
import 'package:basicflutter/page_root_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'googleauth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final FirebaseFirestore UserCollection = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "เข้าสู่ระบบ",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          //ป้องกัน button overflow
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/profile-user.png',
                    height: 49,
                    width: 49,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //Text Email
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              //Text Password
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 30,
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
                    // Navigator.push(
                    //     context, //ลิ้งไปยังหน้าต่อไปยังหน้า PageLogin
                    //     MaterialPageRoute(builder: (context) {
                    //   return PageLogin();
                    // }));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(30, 194, 165, 100),
                      minimumSize: Size(222, 48)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Create account",
                  style: TextStyle(
                    color: Color.fromRGBO(19, 143, 121, 1),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                    fontSize: 14,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("OR",
                  style: TextStyle(
                    color: Color.fromARGB(255, 95, 95, 95),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                    fontSize: 12,
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  child: Row(
                    children: [
                      Text("......."),
                      Image.asset(
                        "image/logo_google.png",
                        width: 30,
                      ),
                      Text("....."),
                      Text("Sign in with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Prompt',
                            fontSize: 14,
                          )),
                    ],
                  ),
                  onPressed: () async {
                    try {
                      signInWithGoogle().then((result) {
                        if (result != null) {
                          print(result);
                          UserCollection.collection("Users")
                              .doc(userid)
                              .get()
                              .then((DocumentSnapshot documentSnapshot) async {
                            if (documentSnapshot.exists) {
                              print(
                                  'Document data: ${documentSnapshot.data()}');
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) {
                                return RootApp();
                              }), ModalRoute.withName('/'));
                            } else {
                              await UserCollection.collection('Users')
                                  .doc(userid)
                                  .set({
                                "Name": name,
                                "Email": email,
                                "UrlImage": imageUrl,
                                "Birthday": DateTime.now(),
                                "Message": "",
                                "Sex": "",
                                "Name2": "",
                                "Time": DateTime.now()
                              }).then((value) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RootApp();
                                    },
                                  ),
                                );
                              }).catchError((error) =>
                                      print("Failed to add user: $error"));
                            }
                          });
                          // ConnectFirebase.addUser(
                          //     Name: name,
                          //     Email: email,
                          //     UrlImage: imageUrl,
                          //     Birthday: DateTime.now(),
                          //     Message: "",
                          //     Sex: "",
                          //     Name2: "",
                          //     Time: DateTime.now());
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return PageLogin();
                          //     },
                          //   ),
                          // );

                        }
                      });
                    } catch (e) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => PageLogin()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, minimumSize: Size(222, 48)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
