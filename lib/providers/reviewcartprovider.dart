import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_app/models/reviewcartModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ReviewCartProvider with ChangeNotifier{
//==================================///////////////add data to the firebase /////////////
  void addReviewCartData({
  required String cartId,
    required String cartName,
    required cartImage,
    required int cartPrice,
    required int cartQuantity,
    var cartUnit,

    
})async{
   await FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("yourReviewCart")..doc(cartId).set(
{
  "cartId": cartId,
  "cartName": cartName,
  "cartImage": cartImage,
  "cartPrice": cartPrice,
  "cartQuantity": cartQuantity,
  "cartUnit": cartUnit,
  "isAdd": true,

});
  }
  ////////////////===========================Update Data in firebase after delete or add==================/////////////
  void updateReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,



  })async{
    await FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("yourReviewCart")..doc(cartId).update(
        {
          "cartId": cartId,
          "cartName": cartName,
          "cartImage": cartImage,
          "cartPrice": cartPrice,
          "cartQuantity": cartQuantity,
          "isAdd": true,

        });
  }

//==================================////////////// get data from firebase //////////=====================
  List<ReviewCartModel>reviewCartDataList = [];
  List<ReviewCartModel>newList =[];
  void getReviewCartData()async{
  QuerySnapshot reviewCartElement= await FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("yourReviewCart").get();
  //reviewCartElement.docs.forEach((element) {
  for (var element in reviewCartElement.docs) {
    ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get('cartImage'),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
        cartUnit: element.get("cartUnit"),
    );
    newList.add(reviewCartModel);
  }
  reviewCartDataList =newList;
  ///we use setState in statefull widget , same as like we use *notify Listerners() for provider///
  notifyListeners();

  }
  List<ReviewCartModel> get  getReviewCartDataList{
    return reviewCartDataList;
  }

  ///////////////////=======Total Price==========\\\\\\\\\\\\\\\\\
  getTotalPrice(){
    double total = 0.0;
    //reviewCartDataList.forEach((element) {
    for (var element in reviewCartDataList) {
      total += element.cartPrice * element.cartQuantity;
    }
    return total;
  }

//==================================////// Delete data from review cart using reviewCartDelete function /////===============================//
reviewCartDataDelete(cartId){
    FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("yourReviewCart").doc(cartId).delete();
    notifyListeners();
}


  }


