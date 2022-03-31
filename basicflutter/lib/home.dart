import 'package:basicflutter/page_list_clock.dart';
import 'package:basicflutter/page_qr.dart';
import 'package:basicflutter/page_set_time.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Align(
            //     alignment: Alignment.bottomRight,
            //     child: Image.asset(
            //       "image/endpage2.png",
            //       height: MediaQuery.of(context).size.height * .2,
            //     )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/Frame1.png',

                        width: 200,
                        height: 50,
                        //color: Colors.black.withOpacity(.4),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QrPage())),
                        child: Icon(Icons.qr_code_scanner,
                            size: 35, color: Color.fromRGBO(22, 150, 127, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(30, 194, 165, 1),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 148,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, bottom: 10, top: 5),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PageListClock())),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/logo1.png',
                                        fit: BoxFit.cover,
                                        height: 56,
                                      ),
                                      Text(
                                        "ตั้งค่าเตือนการใช้ยา",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(22, 150, 127, 1),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Prompt',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {
                                launch(
                                    "https://www.google.com/maps/search/โรงพยาบาลใกล้ฉัน/")
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(30, 194, 165, 1),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 148,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, bottom: 10, top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/logo2.png',
                                        fit: BoxFit.cover,
                                        height: 56,
                                      ),
                                      Text(
                                        "ตำแหน่งโรงพยาบาล",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(22, 150, 127, 1),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Prompt',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(30, 194, 165, 1),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 148,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, bottom: 10, top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      'assets/logo3.png',
                                      fit: BoxFit.cover,
                                      height: 56,
                                    ),
                                    Text(
                                      "สาระเกี่ยวกับยา",
                                      style: TextStyle(
                                        color: Color.fromRGBO(22, 150, 127, 1),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Prompt',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {launch("tel://1669")},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(218, 55, 55, 1),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 148,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, bottom: 10, top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/logo4.png',
                                        fit: BoxFit.cover,
                                        height: 56,
                                      ),
                                      Text(
                                        "ฉุกเฉิน",
                                        style: TextStyle(
                                          color: Color.fromRGBO(218, 55, 55, 1),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Prompt',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
