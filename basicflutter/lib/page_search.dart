// import 'package:basicflutter/ConnectFirebase.dart';
// import 'package:basicflutter/Page_DetailMedicine.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List data = [];
//   List ImageList = [];
//   List<String> items = [
//     "Food",
//     "Transport",
//     "Personal",
//     "Shopping",
//     "Medical",
//     "Rent",
//     "Movie",
//     "Salary"
//   ];
//   @override
//   void initState() {
//     ConnectFirebase.getMedicine().then((value) async {
//       data = [];
//       ImageList = [];
//       for (var datas in value) {
//         data.add(
//           {
//             "name": datas["name"],
//             "type": datas["type"],
//             "details": datas["details"]
//           },
//         );
//         ImageList.add(await firebase_storage.FirebaseStorage.instance
//             .ref('image_medicine/${datas["name"]}.png')
//             .getDownloadURL());
//       }
//       print(ImageList);
//       //คำสั่งเช็คหน้า widget ว่าโหลดเสร็จแล้วยัง
//       if (mounted) {
//         setState(() {});
//       }
//     });
//     //  getImages(name: datas["name"]);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "ค้นหาข้อมูลยา",
//           style: TextStyle(
//             fontFamily: 'Prompt',
//             fontSize: 18,
//           ),
//         ),
//         backgroundColor: Color.fromRGBO(30, 194, 165, 100),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//             child: ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             return detailMedicine(
//               name: data[index]["name"],
//               type: data[index]["type"],
//               details: data[index]["details"],
//               index: index,
//             );
//           },
//         )),
//       ),
//     );
//   }

// //สร้าง widget ไว้สำหรับเรียกใช้ โดยให้รับตัวแปร name และ type
//   Widget detailMedicine(
//       {required String name,
//       required String type,
//       required var details,
//       required int index}) {
//     return InkWell(
//       onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => PageDetailMedicine(details: details))),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         margin: const EdgeInsets.only(top: 10),
//         decoration: BoxDecoration(
//             border:
//                 Border.all(width: 1, color: Color.fromRGBO(224, 224, 224, 1))),
//         child: Row(
//           children: [
//             Column(
//               children: [
//                 (ImageList.isEmpty)
//                     ? Image.asset(
//                         'assets/Detailmedicine.png',
//                         height: 10,
//                       )
//                     : Image.network(
//                         ImageList[index],
//                         width: 100,
//                       ),
//               ],
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "ชื่อยาทางการค้า : ",
//                       style: TextStyle(
//                           fontFamily: 'Prompt',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Color.fromRGBO(57, 137, 123, 1)),
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       name,
//                       style: TextStyle(
//                           fontFamily: 'Prompt',
//                           fontSize: 14,
//                           color: Colors.black),
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       type,
//                       style: TextStyle(
//                           fontFamily: 'Prompt',
//                           fontSize: 12,
//                           color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
