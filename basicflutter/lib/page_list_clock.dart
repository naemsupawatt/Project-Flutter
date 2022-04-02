import 'package:basicflutter/page_set_time.dart';
import 'package:flutter/material.dart';

class PageListClock extends StatefulWidget {
  const PageListClock({Key? key}) : super(key: key);

  @override
  State<PageListClock> createState() => _PageListClockState();
}

class _PageListClockState extends State<PageListClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ตั้งค่าเตือนการใช้ยา",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "รายการ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        fontSize: 24,
                        color: Color.fromARGB(255, 37, 37, 37),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(186, 186, 186, 1), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "ชื่อยา : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 72, 71, 71),
                                ),
                              ),
                              Text(
                                "ไซเมนิโคน",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 72, 71, 71),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "06:00 น.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Prompt',
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 72, 71, 71),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "วัน",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 93, 91, 91),
                                ),
                              ),
                              Text(
                                "ศุกร์",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 93, 91, 91),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(120, 0, 0, 0),
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                            ),
                            onPressed: () {
                              //ลบเวลาทิ้ง
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  child: Icon(
                    Icons.add_circle,
                    size: 40,
                    color: Color(0xFF1EC2A5),
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageSetTime())),
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
