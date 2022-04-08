import 'package:basicflutter/test.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageAboutMedicine extends StatefulWidget {
  const PageAboutMedicine({Key? key}) : super(key: key);

  @override
  State<PageAboutMedicine> createState() => _PageAboutMedicineState();
}

class _PageAboutMedicineState extends State<PageAboutMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "สาระเกี่ยวกับยา",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                            title: Text(
                              'เรื่องน่ารู้เกี่ยวกับ COVID-19',
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  color: Color.fromRGBO(57, 137, 123, 1)),
                            ),
                            // subtitle: Text(
                            //   'ข้อควรรู้เกี่ยวกับยา',
                            //   style: TextStyle(
                            //       fontFamily: 'Prompt',
                            //       fontSize: 16,
                            //       color: Colors.black),
                            // ),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Test()));
                                })),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                            title: Text(
                              'วิธีการเก็บรักษายา',
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  color: Color.fromRGBO(57, 137, 123, 1)),
                            ),
                            // subtitle: Text(
                            //   'ข้อควรรู้เกี่ยวกับยา',
                            //   style: TextStyle(
                            //       fontFamily: 'Prompt',
                            //       fontSize: 16,
                            //       color: Colors.black),
                            // ),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Test()));
                                })),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
