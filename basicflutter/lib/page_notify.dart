import 'package:basicflutter/page_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  var textEditController = new TextEditingController();
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("detailsMedicine")
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
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                leading: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.network(data["image"]),
                ),
                title: Text(data["name"]),
                subtitle: Text(data["type"]),
                onTap: () {
                  print(document.id);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PageDetail(
                      valueFromSearch: document.id,
                    );
                  }));
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
