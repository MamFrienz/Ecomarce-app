import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/providers/reviewcartprovider.dart';
import 'package:eco_app/widgets/counters.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

//this take stateless
class SingleItem extends StatefulWidget {
  bool isbool = false;
  bool favList = false;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  int productQuantity;
  Function onDelete;
  var productUnit;

  SingleItem({
    required this.isbool,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
    required this.onDelete,
    required this.favList,
    required this.productUnit,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  //bool favList= false;

  @override
  Widget build(BuildContext context) {
    getCount();
    //print("check cart value= ${widget.productQuantity}");
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isbool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(widget.productName),
                          Text(
                            "${widget.productPrice}\$",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      widget.isbool == false
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            leading: new Icon(Icons.photo),
                                            title: new Text('2 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            //leading: new Icon(Icons.music_note),
                                            title: new Text('3 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            //leading: new Icon(Icons.videocam),
                                            title: new Text('4 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            //leading: new Icon(Icons.share),
                                            title: new Text('5 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "1Kg",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Text(widget.productUnit),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: 100,
                padding: widget.isbool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: widget.isbool == false
                    //child: favList == false
                    ? Counter(
                        productId: widget.productId,
                        productName: widget.productName,
                        productImage: widget.productImage,
                        productPrice: widget.productPrice,
                        productUnit: widget.productUnit,
                        productQuantity: "1")
                    //   Container(
                    //     height: 25,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: Center(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(
                    //             Icons.add,
                    //             color: primaryColor,
                    //             size: 20,
                    //           ),
                    //           Text(
                    //             "ADD",
                    //             style: TextStyle(
                    //                 color: primaryColor, fontSize: 13),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   )
                    : Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  widget.onDelete;
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black54,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (count == 1) {
                                          Fluttertoast.showToast(
                                              msg: "Minimum limit 1");
                                        } else {
                                          setState(() {
                                            count--;
                                          });
                                          reviewCartProvider
                                              .updateReviewCartData(
                                                  cartId: widget.productId,
                                                  cartName: widget.productName,
                                                  cartImage:
                                                      widget.productImage,
                                                  cartPrice:
                                                      widget.productPrice,
                                                  cartQuantity: count);
                                        }
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          if (count < 10) {
                                            setState(() {
                                              count++;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                                    cartId: widget.productId,
                                                    cartName:
                                                        widget.productName,
                                                    cartImage:
                                                        widget.productImage,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count);
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove_shopping_cart_outlined,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "$count",
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 13),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              )),
              widget.isbool == false
                  ? Container()
                  : Divider(
                      height: 1,
                      color: Colors.black,
                    ),
            ],
          ),
        ),
        widget.isbool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black,
              ),
      ],
    );
  }
}
