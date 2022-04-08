import 'dart:async';
import 'package:basicflutter/page_account.dart';
import 'package:basicflutter/page_root_app.dart';
import 'package:flutter/material.dart';
import 'googleauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AccountPage()));
      } else {
        print('User is signed in!');
        splashscreenSignedin(
            user.displayName, user.email, user.photoURL, user.uid);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RootApp()));
      }
    });
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Stack(children: [
                    Container(
                      child: Image.asset(
                        'assets/Frame_Index.png',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 600),
                        child: Container(
                          child: CircularProgressIndicator(
                            backgroundColor: Color.fromRGBO(30, 194, 165, 1),
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
