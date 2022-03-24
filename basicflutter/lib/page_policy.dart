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
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(186, 186, 186, 1))),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "ข้อตกลงการใช้บริการ",
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromRGBO(57, 137, 123, 1)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "แอปพลิเคชันการใช้งานด้วยรหัสคิวอาร์โค้ด",
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromRGBO(57, 137, 123, 1)),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "     ข้อกำหนดและเงื่อนไขทั้งหมดในเอกสารฉบับนี้บังคับสำหรับการที่ท่านเข้าใช้งานแอปพลิชันทางโทรศัพท์มือถือหรือสมาร์ทโฟนถือว่าท่านรับทราบและยอมรับเงื่อนไขและข้อกำหนดต่างๆเหล่านี้ทั้งหมดแล้วดังนั้นหากท่านไม่ตกลงที่จะผูกพันตามข้อกำหนดข้อใดข้อหนึ่งหรือทั้งหมดกรุณายกเลิกใช้แอปพลิเคชันทางโทรศัพท์มือถือหรือสมาร์ทโฟน",
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(75, 75, 75, 1)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(186, 186, 186, 1))),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "การลงทะเบียนและบัญชีผู้ใช้งาน",
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromRGBO(57, 137, 123, 1)),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "     ผู้จัดทำขอสงวนสิทธิให้เฉพาะผู้ใช้งานที่ลงทะเบียนเพื่อสร้างบัญชีกับระบบที่จะสามารถตั้งเวลาการใช้ยาหรือค้นหาวิธีการใช้ยาเมื่อท่านตกลงสร้างบัญชีให้ถือว่าท่านตกลงดังต่อไปนี้",
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(75, 75, 75, 1)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "- ท่านตกลงให้ข้อมูลรายละเอียดที่ถูกต้องตรงต่อความจริง และเป็นปัจจุบัน",
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(75, 75, 75, 1)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "- ท่านจะรักษาความปลอดภัยของบัญชีของท่านโดยเก็บรักษาชื่อบัญชีและรหัสผ่านเป็นความลับของท่านแต่เพียงผู้เดียวและจำกัดไม่ให้บุคคลภายนอกเข้าถึงบัญชีและคอมพิวเตอร์ของท่าน",
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(75, 75, 75, 1)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(186, 186, 186, 1))),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "ข้อจำกัดความรับผิดชอบของผู้จัดทำ",
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromRGBO(57, 137, 123, 1)),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "- ท่านรับทราบและตกลงอย่างชัดเจนว่าผู้จัดทำไม่มีความรับผิดชอบต่อความผิดพลาดของเนื้อหา(หมายถึง ข้อความ ภาพประกอบ รูปถ่าย เครื่องหมายการค้า ข้อมูล หรือส่วนประกอบอื่นๆ) ใดๆ แอปพลิเคชัน",
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(75, 75, 75, 1)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
