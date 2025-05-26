import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUser(String userId, Map<String, dynamic> userInforMap) {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userInforMap);
  }

  Future getUserById(String userId) {
    return FirebaseFirestore.instance.collection("User").doc(userId).get();
  }
}
