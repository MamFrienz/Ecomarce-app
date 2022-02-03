import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_app/Config/colors.dart';
//import 'package:eco_app/models/productmodel.dart';
import 'package:eco_app/providers/reviewcartprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;
  var productUnit;
  String productQuantity;

  Counter(
      {required this.productName,
      required this.productImage,
      required this.productId,
      required this.productPrice,
      required this.productUnit,
      required this.productQuantity});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  bool isBool = false;
  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count = value.get("cartQuantity");
                        isBool = value.get("isAdd");
                      })
                    },
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Expanded(
      child: Container(
        height: 25,
        width: 50,
        decoration: BoxDecoration(
          //border: Border.all(color:Colors.blueGrey),
          //color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: isBool == true
            ? Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isBool = false;
                        });
                        reviewCartProvider
                            .reviewCartDataDelete(widget.productId);
                      } else if (count > 1) {
                        setState(() {
                          count--;
                        });
                        reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartName: widget.productName,
                          cartImage: widget.productImage,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                        );
                      }
                      ;
                    },
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartName: widget.productName,
                          cartImage: widget.productImage,
                          cartPrice: widget.productPrice,
                          cartQuantity: count);
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isBool = true;
                    });
                    reviewCartProvider.addReviewCartData(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                      cartUnit: widget.productUnit,
                    );
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
