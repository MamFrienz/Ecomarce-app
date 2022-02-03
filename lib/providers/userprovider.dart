import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_app/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {required User currentUser,
      String? userName,
      String? userEmail,
      String? userImage}) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userId": currentUser.uid,
    });
  }

  late UserModel currentData;
  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
          userName: value.get("userName"),
          userEmail: value.get("userEmail"),
          userImage: value.get("userImage"),
          userId: value.get("userId"));
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}
