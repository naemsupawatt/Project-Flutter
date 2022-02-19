import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('Users');
final detailsMedicine =
    FirebaseFirestore.instance.collection('detailsMedicine');

class ConnectFirebase {
  static Future<void> addUser(
      {required String Name,
      required String Sex,
      required String UrlImage,
      required DateTime Birthday,
      required String Email,
      required String Message,
      required String Name2,
      required DateTime Time}) {
    return users.add({
      "Email": Email,
      "Account": {
        "Name": Name,
        "Sex": Sex,
        "UrlImage": UrlImage,
        "Birthday": Birthday,
      },
      "MedicationReminder": {"Message": Message, "Name": Name2, "Time": Time},
    });
  }

  static Future getMedicine() async {
    var response = await detailsMedicine.get();
    return response.docs;
  }
}
