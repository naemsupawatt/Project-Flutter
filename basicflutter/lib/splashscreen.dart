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
    var duration = Duration(seconds: 1);
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/headpage.png',
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 160),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Frame1.png',
                          width: 256,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 280),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/endpage.png',
                                  width: 200,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  backgroundColor:
                                      Color.fromRGBO(30, 194, 165, 1),
                                  strokeWidth: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Container(
              //   child: Stack(children: [
              //     Padding(padding: EdgeInsets.only(top: 20.0)),
              //     Center(
              //       child: Padding(
              //         padding: const EdgeInsets.only(top: 600),
              // child: Container(
              //   child: CircularProgressIndicator(
              //     backgroundColor: Color.fromRGBO(30, 194, 165, 1),
              //     strokeWidth: 2,
              //   ),
              // ),
              //       ),
              //     )
              //   ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
