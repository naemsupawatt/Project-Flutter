import 'package:basicflutter/page_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PageSearch extends StatefulWidget {
  const PageSearch({Key? key}) : super(key: key);

  @override
  _PageSearchState createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  var textEditController = new TextEditingController();
  var Search = null;
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'ใส่ชื่อยาที่ต้องการค้นหา...',
              ),
              onChanged: (text) {
                print('First text field: $text');
                setState(() {
                  Search = text;
                });
              },
            ),
            Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("detailsMedicine")
                    .where("name", isGreaterThanOrEqualTo: Search)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    // return Text("Something went wrong");
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return InkWell(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(224, 224, 224, 1))),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.network(
                                        data["image"],
                                        height: 90,
                                        width: 90,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "ชื่อยาทางการค้า : ",
                                            style: TextStyle(
                                                fontFamily: 'Prompt',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    57, 137, 123, 1)),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            data["name"],
                                            style: TextStyle(
                                                fontFamily: 'Prompt',
                                                fontSize: 16,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            data["type"],
                                            style: TextStyle(
                                                fontFamily: 'Prompt',
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            print(document.id);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PageDetail(
                                valueFromSearch: document.id,
                              );
                            }));
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
