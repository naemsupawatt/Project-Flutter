// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class PageDetailMedicine extends StatefulWidget {
//   //รับค่าจาก class SearchPage เพื่อมาใช้ต่อ
//   final details;
//   PageDetailMedicine({required this.details});

//   @override
//   _PageDetailMedicineState createState() => _PageDetailMedicineState();
// }

// class _PageDetailMedicineState extends State<PageDetailMedicine> {
//   String ImagesURL = "";
//   getImages({required String name}) async {
//     try {
//       ImagesURL = await firebase_storage.FirebaseStorage.instance
//           .ref('image_medicine/${name}.png')
//           .getDownloadURL();
//       setState(() {});
//     } catch (e) {}
//   }

//   @override
//   void initState() {
//     //print id มาครั้งนึง widget.id คือการนำข้อมูลที่รับมาใช้งาน
//     print(widget.details);
//     getImages(name: widget.details["medicineGeneric"]);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "รายละเอียดข้อมูลยา",
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'Prompt',
//             fontSize: 18,
//           ),
//         ),
//         backgroundColor: Color.fromRGBO(30, 194, 165, 100),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Center(
//           child: ListView(
//             children: [
//               SizedBox(
//                 height: 152,
//                 width: 294,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 30),
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: Color.fromRGBO(186, 186, 186, 100))),
//                   child: (ImagesURL == "")
//                       ? Image.asset(
//                           'assets/Detailmedicine.png',
//                         )
//                       : Image.network(ImagesURL),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "ชื่อยาสามัญ",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["medicineGeneric"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "รูปแบบยา",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["medicineType"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "สรรพคุณของยา",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["medicinalProperties"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "การใช้ยา",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["medicineUse"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "คำแนะนำการใช้ยา",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["instructions"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "อาการไม่พึงประสงค์ยา",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["medicineAdverseReactions"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "ข้อห้ามใช้",
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["contrainDications"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: SizedBox(
//                   width: 294,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(186, 186, 186, 100))),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "การเก็บรักษายา",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color.fromRGBO(30, 194, 165, 1),
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Prompt',
//                               fontSize: 15,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           const Divider(
//                             color: Color.fromRGBO(203, 203, 203, 100),
//                             height: 1,
//                             thickness: 2,
//                             indent: 25,
//                             endIndent: 25,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${widget.details["medicineStorage"]}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(142, 142, 142, 1),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Prompt',
//                                 fontSize: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
