import 'package:basicflutter/page_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          "ค้นหาข้อมูลยา",
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '',
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                // helperText: 'Keep it short, this is just a demo.',
                labelText: 'ค้นหาด้วยชื่อยาสามัญ',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
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
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: ListTile(
                                          leading: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minWidth: 44,
                                              minHeight: 44,
                                              maxWidth: 64,
                                              maxHeight: 64,
                                            ),
                                            child: Image.network(data["image"]),
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "ชื่อยาทางการค้า",
                                                style: TextStyle(
                                                    fontFamily: 'Prompt',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        57, 137, 123, 1)),
                                              ),
                                              Text(
                                                data["name"],
                                                style: TextStyle(
                                                    fontFamily: 'Prompt',
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          subtitle: Text(
                                            data["type"],
                                            style: TextStyle(
                                                fontFamily: 'Prompt',
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
