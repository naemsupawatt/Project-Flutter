import 'package:basicflutter/googleauth.dart';
import 'package:basicflutter/page_detail.dart';
import 'package:basicflutter/page_set_time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageListClock extends StatefulWidget {
  const PageListClock({Key? key}) : super(key: key);

  @override
  _PageListClockState createState() => _PageListClockState();
}

class _PageListClockState extends State<PageListClock> {
  var textEditController = new TextEditingController();
  var Search = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ค้นหาข้อมูลยา",
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
            Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("collectionNotify")
                    .where("UserID", isEqualTo: userid)
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
                        return Container(
                          child: Column(children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(
                                    'ชื่อยา : ${data["Name"]}',
                                    style: TextStyle(
                                        fontFamily: 'Prompt',
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 36, 36, 36)),
                                  ),
                                  subtitle: Text(
                                    'เวลา  : ${data["Hour"]}:${data["Minute"]} น.',
                                    style: TextStyle(
                                        fontFamily: 'Prompt',
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 36, 36, 36)),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Color.fromARGB(255, 85, 85, 85),
                                    onPressed: () {
                                      print(document.id);
                                      FirebaseFirestore.instance
                                          .collection("collectionNotify")
                                          .doc(document.id)
                                          .delete()
                                          .then(
                                              (value) => print("User Deleted"))
                                          .catchError((error) => print(
                                              "Failed to delete user: $error"));
                                    },
                                  ),
                                ),
                              ),
                            )
                          ]),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PageSetTime()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: Color.fromRGBO(30, 194, 165, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
