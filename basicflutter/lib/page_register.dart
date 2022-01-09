import 'package:basicflutter/model/page_profile.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({Key? key}) : super(key: key);

  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
    email: ' ',
    password: ' ',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("สร้างบัญชีผู้ใช้"),
        backgroundColor: Color.fromRGBO(30, 194, 165, 100),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 35, 40, 0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("อีเมล์", style: TextStyle(fontSize: 16)),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อนอีเมล์"),
                      EmailValidator(errorText: "รูปป้อนอีเมล์ไม่ถูกต้อง")
                    ]),
                    keyboardType: TextInputType
                        .emailAddress, //ให้แป้นพิมพ์รู้ว่ากำลังพิมพ์ Email เพิ่ม @
                    onSaved: (String? email) {
                      profile.email = email!;
                    },

                    //เก็บข้อมูล email ไว้ในตัวแปล email
                  ),
                  SizedBox(height: 20),
                  Text("รหัสผ่าน", style: TextStyle(fontSize: 16)),
                  TextFormField(
                    validator:
                        RequiredValidator(errorText: "กรุณาป้อนรหัสผ่าน"),
                    obscureText: true, //ปิดบังรหัสผ่าน **********
                    onSaved: (String? password) {
                      profile.password = password!;
                    }, //เก็บข้อมูล password ไว้ในตัวแปล password
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(30, 194, 165, 100),
                          minimumSize: Size(222, 48)),
                      child: Text("ลงทะเบียน",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!
                              .save(); // Save ข้อมูลจาก Onsave มาไว้ในตัวแปร
                          print(
                              "email = ${profile.email} \npassword = ${profile.password}");
                          formKey.currentState!
                              .reset(); //เครีย Form ให้เป็นค่าว่าง
                        } //ตรวจสอบความถูกต้องของข้อมูล
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
