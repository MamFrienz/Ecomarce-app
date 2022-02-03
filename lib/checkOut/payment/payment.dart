import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/checkOut/payment/googlePay.dart';
//import 'package:eco_app/checkOut/payment/order.dart';
import 'package:eco_app/models/deliveryLocModel.dart';
//import 'package:eco_app/providers/checkoutProvider.dart';
//import 'package:eco_app/providers/productprovider.dart';
import 'package:eco_app/providers/reviewcartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../singleDeliveryItem.dart';
import 'order.dart';

class Payment extends StatefulWidget {
  final DeliveryLocModel deliveryLocList;
  Payment({required this.deliveryLocList});

  @override
  _PaymentState createState() => _PaymentState();
}

enum LocationType {
  Home,
  OnlinePayment,
}

class _PaymentState extends State<Payment> {
  var myType = LocationType.Home;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    double discountValue = 0;
    //double shippinfCharge = 3.7;
    double total = 0;
    double totalPrice = reviewCartProvider.getTotalPrice();
    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }

    return Scaffold(
        appBar: AppBar(title: Text("Payment of your products")),
        bottomNavigationBar: ListTile(
          title: Text("Total price"),
          subtitle: Text(
            "\$${total + 3
                //??totalPrice
             }",
            style: TextStyle(
              color: Colors.green,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Container(
              width: 160,
              child: MaterialButton(
                onPressed: () {
                  myType == LocationType.OnlinePayment
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GooglePay(
                              total: total,
                            ),
                          ),
                        )
                      : Container();
                },
                child: Text(
                  "Take your order",
                  style: TextStyle(color: textColor),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SingleDeliveryItem(
                      address:
                          " street, ${widget.deliveryLocList.street},city, ${widget.deliveryLocList.cityName}, mobile, ${widget.deliveryLocList.mobileNum},location type, ${widget.deliveryLocList.locationType}",
                      title:
                          "${widget.deliveryLocList.firstName} ${widget.deliveryLocList.lastName}",
                      number: "${widget.deliveryLocList.mobileNum}",
                     addressType: widget.deliveryLocList.locationType ==
                          "LocationType.Home"
                          ? "Home"
                          : widget.deliveryLocList.locationType ==
                          "LocationType.Other"
                          ? "Other"
                          : "Work",
                    ),
                    Divider(),
                    ExpansionTile(
                      children:
                          reviewCartProvider.getReviewCartDataList.map((e) {
                        return OrderItem(
                          e: e,
                        );
                      }).toList(),
                      // children:[
                      // OrderItem(),
                      // OrderItem(),
                      // OrderItem(),
                      // OrderItem(),
                      // OrderItem(),
                      // ],
                      title: Text(
                          "Order Items: ${reviewCartProvider.getReviewCartDataList.length}"),
                    ),
                    Divider(),
                    ListTile(
                      minVerticalPadding: 5,
                      leading: Text("Sub Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      trailing: Text("\$${totalPrice + 3}",
                          style: TextStyle(color: Colors.grey)),
                    ),
                    ListTile(
                      minVerticalPadding: 5,
                      leading: Text("Shipping Charge",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      trailing: Text("\$${discountValue}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    ListTile(
                      minVerticalPadding: 5,
                      leading: Text("Discount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      trailing: Text("\$300",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text("Payment Option"),
                    ),
                    RadioListTile(
                      value: LocationType.Home,
                      groupValue: myType,
                      title: Text("Home"),
                      onChanged: (LocationType ?value) {
                        setState(() {
                          myType = value!;
                        });
                      },
                      secondary: Icon(
                        Icons.home_outlined,
                        color: primaryColor,
                      ),
                    ),
                    RadioListTile(
                      value: LocationType.OnlinePayment,
                      groupValue: myType,
                      title: Text("Online Payment"),
                      onChanged: (LocationType ?value) {
                        setState(() {
                          myType = value!;
                        });
                      },
                      secondary: Icon(
                        Icons.other_houses_sharp,
                        color: primaryColor,
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}
