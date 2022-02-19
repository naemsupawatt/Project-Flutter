import 'package:flutter/material.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "การแจ้งเตือน",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Container(
              child: SizedBox(
                height: 100,
                width: 294,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(186, 186, 186, 100))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "ชื่อยาสามัญ",
                          style: TextStyle(
                            color: Color.fromRGBO(30, 194, 165, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Prompt',
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Color.fromRGBO(203, 203, 203, 100),
                          height: 1,
                          thickness: 2,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "คาลาไมน์",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromRGBO(142, 142, 142, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Prompt',
                            fontSize: 15,
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
