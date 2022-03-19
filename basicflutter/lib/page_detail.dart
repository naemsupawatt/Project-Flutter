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

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          data["image"],
                          height: 150,
                          width: 150,
                        )
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "ชื่อยาสามัญ : ",
                            style: TextStyle(
                                fontFamily: 'Prompt',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(57, 137, 123, 1)),
                          ),
                          Flexible(
                            child: Text(
                              data["details"]["medicineGeneric"],
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "รูปแบบยา : ",
                            style: TextStyle(
                                fontFamily: 'Prompt',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(57, 137, 123, 1)),
                          ),
                          Flexible(
                            child: Text(
                              data["details"]["instructions"],
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "รูปแบบยา : ",
                            style: TextStyle(
                                fontFamily: 'Prompt',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(57, 137, 123, 1)),
                          ),
                          Flexible(
                            child: Text(
                              data["details"]["instructions"],
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
