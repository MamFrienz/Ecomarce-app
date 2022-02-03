import 'package:eco_app/models/reviewcartModel.dart';
import 'package:flutter/material.dart';
class OrderItem extends StatelessWidget {
  final ReviewCartModel e;
  OrderItem({required this.e});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(e.cartImage,width: 60,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(e.cartName, style: TextStyle(color: Colors.grey),),
          Text(e.cartUnit, style: TextStyle(color: Colors.grey),),
          Text("\$${e.cartPrice}", style: TextStyle(color: Colors.grey),),


        ],
      ),
      subtitle: Text(e.cartQuantity.toString(),),
    );
  }
}
