import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_app/models/deliveryLocModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

class CheckOutProvider with ChangeNotifier{
  bool isloading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNum = TextEditingController();
  TextEditingController cityName = TextEditingController();
  TextEditingController street = TextEditingController();
  late LocationData selectLocation;

  void validator(context,myType)async {
    isloading = true;
    notifyListeners();
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Filled first Name");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Filled last name");
    } else if (mobileNum.text.isEmpty) {
      Fluttertoast.showToast(msg: "Filled mobile number");
    }
    else if (cityName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Filled city name");
    }
    else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Filled street name");
    }
    else if (selectLocation == null) {
      Fluttertoast.showToast(msg: "Select your location");
    }
    else {
      isloading = true;
      notifyListeners();
      await FirebaseFirestore.instance.collection("addDeliveryLocation").doc(
          FirebaseAuth.instance.currentUser!.uid).set({
        "firstname": firstName.text,
        "lastname": lastName.text,
        "mobile": mobileNum.text,
        "city": cityName.text,
        "street": street.text,
        "location Tyoe": myType.toString(),
        // "select location": selectLoc.text,
        "latitude": selectLocation.latitude,
        "longitude": selectLocation.longitude,
      }).then((value) async {
        isloading = false;
        await Fluttertoast.showToast(msg: "Successfully Saved");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

List<DeliveryLocModel>deliveryLocList=[];
getDeliveryLocData()async{
  List<DeliveryLocModel>newList=[];

    DeliveryLocModel deliveryLocModel;

   DocumentSnapshot _islocdata = await FirebaseFirestore.instance.
    collection("addDeliveryLocation").
    doc(FirebaseAuth.instance.currentUser!.uid).get();
   if (_islocdata.exists){
     deliveryLocModel =DeliveryLocModel(
       firstName: _islocdata.get("firstname"),
       lastName: _islocdata.get("lastname"),
       mobileNum: _islocdata.get("mobile"),
       cityName: _islocdata.get( "city"),
       street: _islocdata.get("street"),
       locationType: _islocdata.get("location Tyoe"),
     );
     newList.add(deliveryLocModel);
     notifyListeners();

   }
  deliveryLocList=newList;
   notifyListeners();


}
List<DeliveryLocModel>get getDeliveryLocList{
  return deliveryLocList;
}
}

////// Order /////////
// addPlaceOderData({
//   List<ReviewCartModel> oderItemList,
//   var subTotal,
//   var address,
//   var shipping,
// }) async {
//   FirebaseFirestore.instance
//       .collection("Order")
//       .doc(FirebaseAuth.instance.currentUser.uid)
//       .collection("MyOrders")
//       .doc()
//       .set(
//     {
//       "subTotal": "1234",
//       "Shipping Charge": "",
//       "Discount": "10",
//       "orderItems": oderItemList
//           .map((e) => {
//         "orderTime": DateTime.now(),
//         "orderImage": e.cartImage,
//         "orderName": e.cartName,
//         "orderUnit": e.cartUnit,
//         "orderPrice": e.cartPrice,
//         "orderQuantity": e.cartQuantity
//       })
//           .toList(),
//       // "address": address
//       //     .map((e) => {
//       //           "orderTime": DateTime.now(),
//       //           "orderImage": e.cartImage,
//       //           "orderName": e.cartName,
//       //           "orderUnit": e.cartUnit,
//       //           "orderPrice": e.cartPrice,
//       //           "orderQuantity": e.cartQuantity
//       //         })
//       //     .toList(),
//     },
//   );
// }
// }
