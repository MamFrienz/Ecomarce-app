// ignore: file_names
import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/models/productmodel.dart';
//import 'package:eco_app/models/productmodel.dart';
import 'package:eco_app/widgets/counters.dart';
import 'package:eco_app/widgets/productunit.dart';
import 'package:flutter/material.dart';

//this take stateless
class SingleProduct extends StatefulWidget {
  // const SingleProduct({ Key? key, Null Function() onTap, String productImage, String productName, String productPrice }) : super(key: key);
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  final Function onTap;
  final ProductModel productUnit;

  const SingleProduct(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId,
      required this.productUnit,
      required this.onTap});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 230,
              width: 150,
              decoration: BoxDecoration(
                color: Color(0xFFE3F2FD),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      child: Image.network(
                        widget.productImage, fit: BoxFit.cover,
                        // 'https://pngimg.com/uploads/dog_food/dog_food_PNG9.png')
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.productName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          Text(
                              '${widget.productPrice}\$/${unitData == null ? firstValue : unitData}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.redAccent)),
                          SizedBox(
                            height: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ProductUnit(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: widget
                                                .productUnit.productUnit
                                                .map<Widget>((data) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          unitData = data;
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        data,
                                                        style: TextStyle(
                                                            color: primaryColor,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }).toList(),
                                          );
                                        });
                                  },
                                  //if unitData is null then show firstvalue, if not null then  show unitdata
                                  title:
                                      unitData == null ? firstValue : unitData,
                                ),
                                // child: InkWell(
                                //   onTap: (){
                                //     showModalBottomSheet(
                                //         context: context,
                                //         builder: (context) {
                                //           return Column(
                                //             mainAxisSize: MainAxisSize.min,
                                //             children: <Widget>[
                                //               ListTile(
                                //                 leading: new Icon(Icons.photo),
                                //                 title: new Text('2 KG'),
                                //                 onTap: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //               ),
                                //               ListTile(
                                //                 //leading: new Icon(Icons.music_note),
                                //                 title: new Text('3 KG'),
                                //                 onTap: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //               ),
                                //               ListTile(
                                //                 //leading: new Icon(Icons.videocam),
                                //                 title: new Text('4 KG'),
                                //                 onTap: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //               ),
                                //               ListTile(
                                //                 //leading: new Icon(Icons.share),
                                //                 title: new Text('5 KG'),
                                //                 onTap: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //               ),
                                //             ],
                                //           );
                                //         });
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.only(left: 2),
                                //     height: 25,
                                //     width: 30,
                                //     decoration: BoxDecoration(
                                //       border: Border.all(color: Colors.blueGrey),
                                //       //color: Colors.greenAccent,
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Row(
                                //       children: [
                                //         Expanded(
                                //           child: Text(
                                //             '1 KG',
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold,
                                //                 fontSize: 11),
                                //           ),
                                //         ),
                                //         Center(
                                //             child: Icon(Icons.arrow_drop_down,
                                //                 size: 20,
                                //                 color: Colors.greenAccent)),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Counter(
                                productId: widget.productId,
                                productName: widget.productName,
                                productImage: widget.productImage,
                                productPrice: widget.productPrice,
                                productUnit:
                                    unitData == null ? firstValue : unitData,
                                productQuantity: "1",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
