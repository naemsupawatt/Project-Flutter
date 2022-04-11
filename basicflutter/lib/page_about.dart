import 'package:flutter/material.dart';

class PageAbout extends StatefulWidget {
  const PageAbout({Key? key}) : super(key: key);

  @override
  _PageAboutState createState() => _PageAboutState();
}

class _PageAboutState extends State<PageAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "เกี่ยวกับโปรแกรม",
            style: TextStyle(
              fontFamily: 'Prompt',
              fontSize: 18,
            ),
          ),
          backgroundColor: Color.fromRGBO(30, 194, 165, 100),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Container(
                  child: Image.asset("image/logo.png"),
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Container(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Container(
                  child: Text(
                    "Medicine Usage with QR Code",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Container(
                  child: Text(
                    "V.1.0",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 50, left: 50, bottom: 10),
                  child: Container(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "จัดทำโดย",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/supawat.jpg',
                                width: 100,
                                height: 100,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "ศุภวัฒน์ หลีกภัย",
                            style: TextStyle(
                              color: Color.fromRGBO(116, 116, 116, 1),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Prompt',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/apinya.jpg',
                                width: 100,
                                height: 100,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "อภิญญา ทวีชาติ",
                            style: TextStyle(
                              color: Color.fromRGBO(116, 116, 116, 1),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Prompt',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 50, left: 50, bottom: 10),
                  child: Container(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "แอปพลิเคชันนี้เป็นส่วนหนึ่งของการศึกษาตามหลักสูตร",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "ครุศาสตร์อุตสาหกรรมบัณฑิต (ครุศาสตร์วิศวกรรม)",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "สาขาครุศาสตร์วิศวกรรม คณะครุศาสตร์อุตสาหกรรม",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "ปีการศึกษา 2564",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
