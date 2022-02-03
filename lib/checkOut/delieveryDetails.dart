//import 'dart:html';

import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/checkOut/addDeliveryLoc/addDeliveryLocation.dart';
import 'package:eco_app/checkOut/payment/payment.dart';
import 'package:eco_app/checkOut/singleDeliveryItem.dart';
import 'package:eco_app/models/deliveryLocModel.dart';
import 'package:eco_app/providers/checkoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DeliveryDetails extends StatefulWidget {




  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryLocModel value;
  @override
  Widget build(BuildContext context) {

    CheckOutProvider deliveryLocProvider= Provider.of(context);
    deliveryLocProvider.getDeliveryLocData();
    return Scaffold(
      appBar: AppBar(title: Text("Delivery"),),

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDeliveryLocation(), ),);
        },
      ),
      bottomNavigationBar: Container(
       // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryLocProvider.getDeliveryLocList.isEmpty?Text("Address of your desire location"):Text("Payment Summary"),
            onPressed:(){
              deliveryLocProvider.getDeliveryLocList.isEmpty?
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDeliveryLocation(), ),):  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Payment(deliveryLocList: value,), ),);
            }
            ,
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      )
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver to"),

            leading:Image.asset("assets/locIcon.png",height: 30,),
          ),
          Divider(height: 1,
          ),
          deliveryLocProvider.getDeliveryLocList.isEmpty?Container(
            child: Center(child: Text("Data is Empty"),),
          ):
          Column(
    children:deliveryLocProvider.getDeliveryLocList.
    map((e) {
      setState(() {
        value = e;
      });
   return SingleDeliveryItem(
    address: " street, ${e.street},city, ${e.cityName}, mobile, ${e.mobileNum},location type, ${e.locationType}",

    title:"${e.firstName} ${e.lastName}",
    number: "${e.mobileNum}", addressType: "${e.locationType}",

    );
    }).toList(),
            // children: [
            //   deliveryLocProvider.getDeliveryLocList.isEmpty?Container(
            //     child: Center(child: Text("Data is Empty"),),
            //   ):
            //   SingleDeliveryItem(
            //     address: "area, dhaka, M alam, street: Basundhara ,20, society 07, postcode 800",
            //     addressType: "Location",
            //     title:"MALAM" ,
            //     number: "016271*****",
            //   )
            // ]
          ),
        ],
      ),
    );
  }
}
