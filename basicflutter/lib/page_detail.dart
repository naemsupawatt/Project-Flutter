import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  final valueFromSearch;
  const PageDetail({Key? key, this.valueFromSearch}) : super(key: key);

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  CollectionReference _DetailStream =
      FirebaseFirestore.instance.collection('detailsMedicine');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "รายละเอียด",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _DetailStream.doc("${widget.valueFromSearch}").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            // return Text("Document does not exist");
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Container(
              child: ListTile(
                leading: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(data['image'])),
                title: Text(data['details']['contrainDications']),
                subtitle: Text(data['type']),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}
