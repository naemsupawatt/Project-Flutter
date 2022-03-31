import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:basicflutter/page_qr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageSetTime extends StatefulWidget {
  const PageSetTime({Key? key}) : super(key: key);

  @override
  State<PageSetTime> createState() => _PageSetTimeState();
}

class _PageSetTimeState extends State<PageSetTime> {
  final NameController = TextEditingController();
  final TimeController = TextEditingController();
  final DateController = TextEditingController();
  final TextController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool _validate = false;
  final _formKey = GlobalKey<FormState>();
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
              height: 480,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(186, 186, 186, 1), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณาใส่ชื่อยา';
                            }
                            return null;
                          },
                          controller: NameController,
                          decoration: InputDecoration(
                              labelText: "กำหนดชื่อยา",
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    var result = await BarcodeScanner.scan();
                                    String qrCodeResultscan =
                                        '${result.rawContent}';
                                    print(qrCodeResultscan);
                                    FirebaseFirestore.instance
                                        .collection('detailsMedicine')
                                        .doc(qrCodeResultscan)
                                        .get()
                                        .then((DocumentSnapshot
                                            documentSnapshot) {
                                      if (documentSnapshot.exists) {
                                        print(
                                            'Document data: ${documentSnapshot.data()}');
                                        final data = documentSnapshot.data()
                                            as Map<String, dynamic>;
                                        print(data["name"]);
                                        setState(() {
                                          NameController.text = data["name"];
                                          TextController.text =
                                              data["details"]["instructions"];
                                        });
                                      } else {
                                        print(
                                            'Document does not exist on the database');
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.qr_code_scanner,
                                    color: Color.fromRGBO(22, 150, 127, 1),
                                  ))),
                          style: TextStyle(
                            fontFamily: 'Prompt',
                            fontSize: 16,
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากำหนดเวลา';
                            }
                            return null;
                          },
                          readOnly: true,
                          enableInteractiveSelection: true,
                          controller: TimeController,
                          decoration: InputDecoration(
                              labelText: "กำหนดเวลา",
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    //     await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.now());

                                    final TimeOfDay? result =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            builder: (context, childWidget) {
                                              return MediaQuery(
                                                  data: MediaQuery.of(context)
                                                      .copyWith(
                                                          // Using 24-Hour format
                                                          alwaysUse24HourFormat:
                                                              true),
                                                  // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
                                                  child: childWidget!);
                                            });
                                    if (result != null) {
                                      selectedTime = result;
                                      print(selectedTime.hour);
                                      print(selectedTime.minute);
                                      setState(() {
                                        TimeController.text =
                                            "${selectedTime.hour} : ${selectedTime.minute} น.";
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.schedule,
                                    color: Color.fromRGBO(22, 150, 127, 1),
                                  ))),
                          style: TextStyle(
                            fontFamily: 'Prompt',
                            fontSize: 16,
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากำหนดวัน';
                            }
                            return null;
                          },
                          controller: DateController,
                          decoration: InputDecoration(
                              labelText: "กำหนดวัน",
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.expand_more,
                                    color: Color.fromRGBO(22, 150, 127, 1),
                                  ))),
                          style: TextStyle(
                            fontFamily: 'Prompt',
                            fontSize: 16,
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณาใส่ข้อความ';
                            }
                            return null;
                          },
                          controller: TextController,
                          decoration: InputDecoration(
                            labelText: "ข้อความที่แจ้งเตือน",
                          ),
                          style: TextStyle(
                            fontFamily: 'Prompt',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                        'บันทึกข้อมูลสำเร็จ ',
                                        style: TextStyle(
                                          fontFamily: 'Prompt',
                                          fontSize: 18,
                                        ),
                                      )),
                                    );
                                  }
                                });
                              },
                              child: Text(
                                'บันทึก',
                                style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(30, 194, 165, 1)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
