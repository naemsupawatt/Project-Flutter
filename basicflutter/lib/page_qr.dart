import 'package:basicflutter/home.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 194, 165, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('สแกนคิวอาร์โค้ดซองยา'),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
        leading: InkWell(
            onTap: () => Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Home())),
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ScanView(
        onCapture: (Qrcode) {
          print(Qrcode);
        },
      ),
    );
  }
}
