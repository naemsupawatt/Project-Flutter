import 'package:basicflutter/ConnectFirebase.dart';
import 'package:basicflutter/Page_DetailMedicine.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List data = [];
  @override
  void initState() {
    ConnectFirebase.getMedicine().then((value) {
      data = [];
      for (var datas in value) {
        data.add(
          {
            "name": datas["name"],
            "type": datas["type"],
            "details": datas["details"]
          },
        );
      }
      setState(() {});
    });
    super.initState();
  }

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
        child: Center(
            child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return detailMedicine(
              name: data[index]["name"],
              type: data[index]["type"],
              details: data[index]["details"],
            );
          },
        )),
      ),
    );
  }

//สร้าง widget ไว้สำหรับเรียกใช้ โดยให้รับตัวแปร name และ type
  Widget detailMedicine(
      {required String name, required String type, required var details}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color.fromRGBO(224, 224, 224, 0.5),
          ),
          borderRadius: BorderRadius.circular(3)),
      child: ListTile(
          title: Text(
            "ชื่อยาทางการค้า :",
            style: TextStyle(
                fontFamily: 'Prompt',
                fontSize: 15,
                color: Color.fromRGBO(57, 137, 123, 1)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Prompt',
                  fontSize: 15,
                ),
              ),
              Text(
                type,
                style: TextStyle(
                  color: Color.fromRGBO(163, 152, 152, 1),
                  fontFamily: 'Prompt',
                  fontSize: 15,
                ),
              ),
            ],
          ),
          tileColor: Colors.white,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageDetailMedicine(
                        details: details,
                      )))),
    );
  }
}
