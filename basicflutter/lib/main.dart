// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:basicflutter/googleauth.dart';
import 'package:basicflutter/home.dart';
import 'package:basicflutter/page_account.dart';
import 'package:basicflutter/page_detail.dart';
import 'package:basicflutter/page_notify.dart';
import 'package:basicflutter/page_root_app.dart';
import 'package:basicflutter/page_search.dart';
import 'package:basicflutter/page_setting.dart';
import 'package:basicflutter/services/local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
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
  final FirebaseFirestore UserCollection = FirebaseFirestore.instance;
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
        padding: const EdgeInsets.fromLTRB(50, 200, 50, 0),
        child: SingleChildScrollView(
          //ป้องกัน button overflow
          child: Column(
            children: [
              //
              SizedBox(
                height: 40,
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
                      Text("...."),
                      Text("Sign in with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Prompt',
                            fontSize: 14,
                          )),
                    ],
                  ),
                  onPressed: () async {
                    try {
                      String? token = await firebaseMessaging.getToken();
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
                              await UserCollection.collection('Users')
                                  .doc(userid)
                                  .update({
                                "tokenNotify": token,
                              }).then((value) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RootApp();
                                    },
                                  ),
                                );
                              }).catchError((error) =>
                                      print("Failed to add user: $error"));
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
                                "Time": DateTime.now(),
                                "tokenNotify": token,
                              }).then((value) {
                                Navigator.of(context).pushReplacement(
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
