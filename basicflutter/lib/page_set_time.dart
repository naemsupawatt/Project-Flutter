import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:basicflutter/page_qr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:basicflutter/googleauth.dart';

class PageSetTime extends StatefulWidget {
  const PageSetTime({Key? key}) : super(key: key);

  @override
  State<PageSetTime> createState() => _PageSetTimeState();
}

class _PageSetTimeState extends State<PageSetTime> {
  final FirebaseFirestore NotifyCollection = FirebaseFirestore.instance;
  final NameController = TextEditingController();
  final TimeController = TextEditingController();
  final DateController = TextEditingController();
  final TextController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool _validate = false;
  final _formKey = GlobalKey<FormState>();

  // Initial Selected Value
  // String dropdownvalue = "จันทร์";

  // List of items in our dropdown menu
  var items = [
    'จันทร์',
    'อังคาร',
    'พุธ',
    'พฤหัสบดี',
    'ศุกร์',
    'เสาร์',
    'อาทิตย์',
  ];
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
                                              data["details"]["medicineUse"];
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
                          onChanged: (Nametext) {
                            setState(() {
                              print("ชื่อยา : ${Nametext}");
                            });
                          },
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
                                      if ((selectedTime.hour == 0 ||
                                              selectedTime.hour == 1 ||
                                              selectedTime.hour == 2 ||
                                              selectedTime.hour == 3 ||
                                              selectedTime.hour == 4 ||
                                              selectedTime.hour == 5 ||
                                              selectedTime.hour == 6 ||
                                              selectedTime.hour == 7 ||
                                              selectedTime.hour == 8 ||
                                              selectedTime.hour == 9) &&
                                          (selectedTime.minute == 0 ||
                                              selectedTime.minute == 1 ||
                                              selectedTime.minute == 2 ||
                                              selectedTime.minute == 3 ||
                                              selectedTime.minute == 4 ||
                                              selectedTime.minute == 5 ||
                                              selectedTime.minute == 6 ||
                                              selectedTime.minute == 7 ||
                                              selectedTime.minute == 8 ||
                                              selectedTime.minute == 9)) {
                                        setState(() {
                                          TimeController.text =
                                              "0${selectedTime.hour} : 0${selectedTime.minute} น.";
                                        });
                                      } else if ((selectedTime.hour != 0 ||
                                              selectedTime.hour != 1 ||
                                              selectedTime.hour != 2 ||
                                              selectedTime.hour != 3 ||
                                              selectedTime.hour != 4 ||
                                              selectedTime.hour != 5 ||
                                              selectedTime.hour != 6 ||
                                              selectedTime.hour != 7 ||
                                              selectedTime.hour != 8 ||
                                              selectedTime.hour != 9) &&
                                          (selectedTime.minute == 0 ||
                                              selectedTime.minute == 1 ||
                                              selectedTime.minute == 2 ||
                                              selectedTime.minute == 3 ||
                                              selectedTime.minute == 4 ||
                                              selectedTime.minute == 5 ||
                                              selectedTime.minute == 6 ||
                                              selectedTime.minute == 7 ||
                                              selectedTime.minute == 8 ||
                                              selectedTime.minute == 9)) {
                                        setState(() {
                                          TimeController.text =
                                              "${selectedTime.hour} : 0${selectedTime.minute} น.";
                                        });
                                      } else if ((selectedTime.hour == 0 ||
                                              selectedTime.hour == 1 ||
                                              selectedTime.hour == 2 ||
                                              selectedTime.hour == 3 ||
                                              selectedTime.hour == 4 ||
                                              selectedTime.hour == 5 ||
                                              selectedTime.hour == 6 ||
                                              selectedTime.hour == 7 ||
                                              selectedTime.hour == 8 ||
                                              selectedTime.hour == 9) &&
                                          (selectedTime.minute != 0 ||
                                              selectedTime.minute != 1 ||
                                              selectedTime.minute != 2 ||
                                              selectedTime.minute != 3 ||
                                              selectedTime.minute != 4 ||
                                              selectedTime.minute != 5 ||
                                              selectedTime.minute != 6 ||
                                              selectedTime.minute != 7 ||
                                              selectedTime.minute != 8 ||
                                              selectedTime.minute != 9)) {
                                        setState(() {
                                          TimeController.text =
                                              "0${selectedTime.hour} : ${selectedTime.minute} น.";
                                        });
                                      } else {
                                        setState(() {
                                          TimeController.text =
                                              "${selectedTime.hour} : ${selectedTime.minute} น.";
                                        });
                                      }
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
                          readOnly: true,
                          enableInteractiveSelection: true,
                          controller: DateController,
                          decoration: InputDecoration(
                            labelText: "กำหนดวัน",
                            suffixIcon: DropdownButton(
                              // Initial Value
                              // value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(
                                Icons.expand_more,
                                color: Color.fromRGBO(22, 150, 127, 1),
                              ),
                              elevation: 16,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              underline: Container(
                                height: 2,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  DateController.text = "${newValue}";
                                  print(newValue);
                                });
                              },
                            ),
                          ),
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
                          onChanged: (Text) {
                            setState(() {
                              print("ข้อความที่แจ้งเตือน : ${Text}");
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print(NameController.text);
                                  print(TimeController.text);
                                  print(DateController.text);
                                  print(TextController.text);
                                  var Hour = selectedTime.hour;
                                  var Minute = selectedTime.minute;
                                  NotifyCollection.collection(
                                          "collectionNotify")
                                      .add({
                                    'Name': NameController.text,
                                    'Day': DateController.text,
                                    'Hour': Hour, // Stokes and Sons
                                    'Minute': Minute,
                                    'Text': TextController.text, // 42
                                    'UserID': userid
                                  }).then((value) {
                                    print("บันทึกข้อมูลยาสำเร็จ");
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
                                    Navigator.pop(context);
                                  }).catchError((error) =>
                                          print("Failed to add user: $error"));
                                }
                              },
                              child: Text(
                                'บันทึก',
                                style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 2, 2, 2),
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
