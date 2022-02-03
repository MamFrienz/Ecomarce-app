import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/providers/favouritelistprovider.dart';
import 'package:eco_app/reviewCart/reviewcart.dart';
import 'package:eco_app/widgets/counters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SigninCharacter { fill, outline }

//this take statefull
class ProductView extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;

  ProductView({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final SigninCharacter _character = SigninCharacter.fill;

  Widget buttonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required Function onTap,
  }) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap(),
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 18,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  bool favListBool = false;

  getFavouriteListBool() {
    FirebaseFirestore.instance
        .collection("FavouriteCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourfavouriteCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        favListBool = value.get("favList");
                      }),
                    }
                }
              // value.docs.forEach((element) {
              //   //in foreach function we cannot use setState directly beause it will show dibugging issues in setState, so that's why we use this.mounted.
              //   if(this.mounted){
              //     setState(() {
              //       favListBool =element.get("favList");
              //     });
              //   }
              // })
            });
  }

  @override
  Widget build(BuildContext context) {
    FavouriteListProvider favouriteListProvider = Provider.of(context);
    // getFavouriteListBool();
    return Scaffold(
      bottomNavigationBar: Row(children: [
        buttonNavigatorBar(
          backgroundColor: primaryColor,
          color: textColor,
          iconColor: Colors.grey,
          title: "Go to cart view",
          iconData: Icons.shopping_cart,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ReviewCart()));
          },
        ),
        buttonNavigatorBar(
          backgroundColor: Colors.grey,
          color: textColor,
          iconColor: Colors.pinkAccent,
          title: "Add to Favorite list",
          iconData:
              favListBool == false ? Icons.favorite_outline : Icons.favorite,
          onTap: () {
            setState(() {
              favListBool = !favListBool;
            });
            if (favListBool == true) {
              favouriteListProvider.addFavouriteListData(
                  favListId: widget.productId,
                  favListName: widget.productName,
                  favListImage: widget.productImage,
                  favListPrice: widget.productPrice,
                  favListQuantity: 2);
            } else {
              favouriteListProvider.favDataDelete(widget.productId);
            }
          },
        ),
      ]),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.green.shade100,
        title: const Center(
          child: Text(
            'Product Details',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(widget.productName),
                        subtitle: Text(widget.productPrice.toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 250,
                        padding: EdgeInsets.all(20),
                        child: Image.network(widget.productImage),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          child: Text(
                            "Available Option",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Colors.green,
                                ),
                                Radio(
                                  value: SigninCharacter.fill,
                                  groupValue: _character,
                                  activeColor: Colors.green[700],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            Text("\$${widget.productPrice}"),
                            //Text(widget.productPrice),
                            Counter(
                              productId: widget.productId,
                              productName: widget.productName,
                              productImage: widget.productImage,
                              productPrice: widget.productPrice,
                              productUnit: "1Kg",
                              productQuantity: "1",
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 30, vertical: 10),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     border:
                            //         Border.all(color: Colors.green.shade100),
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.add,
                            //         size: 18,
                            //         color: Colors.black45,
                            //       ),
                            //       Text(
                            //         'ADD',
                            //         style: TextStyle(
                            //             fontSize: 17, color: Colors.green),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ))),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this beef product",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "This beef is too fresh and adjustable price. We provide the best product for you in short time in delievery process.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
