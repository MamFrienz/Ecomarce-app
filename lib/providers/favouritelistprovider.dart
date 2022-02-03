import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_app/models/productmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouriteListProvider with ChangeNotifier {
  ///////////////////////////////////////// add favourite list cart data in firebase /////////////////////////////
  void addFavouriteListData({
    required String favListId,
    required String favListName,
    required String favListImage,
    required int favListPrice,
    required int favListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("FavouriteCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourFavouriteCart")
        .doc(favListId)
        .set({
      "favListId": favListId,
      "favListName": favListName,
      "favListImage": favListImage,
      "favListPrice": favListPrice,
      "favListQuantity": favListQuantity,
      "favList": true,
    });
  }

  ///////////////////////////////////////////////////////// Get favourite cart list data from firebase to rendering ///////////////////////
  List<ProductModel> favList = [];
  getFavListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("FavouriteCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourFavouriteCart")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productImage: element.get("favListImage"),
        productName: element.get("favListName"),
        productPrice: element.get("favListPrice"),
        productId: element.get("favListId"),
        productQuantity: element.get("favListQuantity"),
        productUnit: element.get("productUnit"),
      );
      newList.add(productModel);
    });
    favList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFavDataList {
    return favList;
  }

////////////////////////////  Delete Favourite list ////////////////////////
  favDataDelete(favId) {
    FirebaseFirestore.instance
        .collection("FavouriteCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourFavouriteCart")
        .doc(favId)
        .delete();
    notifyListeners();
  }
}
