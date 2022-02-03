import 'package:eco_app/models/productmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  // we don't use more time so we just call a function for every foreach task at once...Let's try
  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      //Get from firebase to model///
      // productmodel <============firebase.
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      productUnit: element.get("productUnit"),
      productQuantity: element.get("productQuantity"),
    );
    search.add(productModel);
  }

  //////////////////makeAllProduct or All products///////////
  List<ProductModel> makeAllProductList = [];
  //late ProductModel productModel;
  fatchmakeAllProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("makeAllProduct").get();
    // data.docs.forEach((element) {
    for (var element in data.docs) {
      // productModel = ProductModel(
      //   productImage: element.get("productImage"),
      //   productName: element.get("productName"),
      //   productPrice: element.get("productPrice"),
      // );
      //we don't use more time so we just call a function for every foreach task at once...Let's try
      productModels(element);
      newList.add(productModel);
    }
    makeAllProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getmakeAllProductDataList {
    return makeAllProductList;
  }

  ///////////////////Biriani/////////////////
  List<ProductModel> birianiProductList = [];
  fatchbirianiProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("birianiProduct").get();
    // data.docs.forEach((element) {
    for (var element in data.docs) {
      // productModel = ProductModel(
      //     productImage: element.get("productImage"),
      //     productName: element.get("productName"),
      //     productPrice: element.get("productPrice"),
      // );
      ////we don't use more time so we just call a function for doing this foreach task at once...Let's try
      productModels(element);
      newList.add(productModel);
    }
    birianiProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getbirianiProductListData {
    return birianiProductList;
  }

  ////////////////////////////when Search icon click then all product get from database//////////
  List<ProductModel> get getallProductDataList {
    return search;
  }
}
