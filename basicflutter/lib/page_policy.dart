import 'package:flutter/material.dart';

class PagePolicy extends StatefulWidget {
  const PagePolicy({Key? key}) : super(key: key);

  @override
  PagePolicyState createState() => PagePolicyState();
}

class PagePolicyState extends State<PagePolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "นโยบายความเป็นส่วนตัว",
            style: TextStyle(
              fontFamily: 'Prompt',
              fontSize: 18,
            ),
          ),
          backgroundColor: Color.fromRGBO(30, 194, 165, 100),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Container(
                  child: Text(
                    "ข้อตกลงการใช้บริการ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(30, 194, 165, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "แอปพลิเคชันการใช้งานด้วยรหัสคิวอาร์โค้ด",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(30, 194, 165, 1),
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
                    "ข้อกำหนดและเงื่อนไขทั้งหมด ในเอกสารฉบับนี้บังคับ",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "สำหรับการที่ท่านเข้าใช้งานแอปพลิชันทางโทรศัพท์มือถือ หรือสมาร์ทโฟน",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "ถือว่าท่านรับทราบและยอมรับเงื่อนไขและข้อกำหนดต่างๆเหล่านี้ทั้งหมดแล้วดังนั้นหากท่านไม่ตกลงที่จะผูกพันตามข้อกำหนดข้อใดข้อหนึ่งหรือทั้งหมดกรุณายกเลิกใช้แอปพลิเคชันทางโทรศัพท์มือถือหรือสมาร์ทโฟน",
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                      fontSize: 14,
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
              ],
            ),
          ),
        ));
  }
}
