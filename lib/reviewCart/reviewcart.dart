
import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/checkOut/delieveryDetails.dart';
import 'package:eco_app/models/reviewcartModel.dart';
import 'package:eco_app/providers/reviewcartprovider.dart';
import 'package:eco_app/widgets/singleItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  //const ReviewCart({Key? key}) : super(key: key);
  showAlertDialog(BuildContext context, ReviewCartModel delete) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you confirm?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title:  Text("Total"),
        subtitle: Text(
          "\$${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(color: Colors.green.shade900),),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
             if(reviewCartProvider.getReviewCartDataList.isEmpty){
               Fluttertoast.showToast(msg: "No card selected");
             }else{
               Navigator.push(context, MaterialPageRoute(builder:(context)=> DeliveryDetails()));
          }},

          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Your Cart", style: TextStyle(color: textColor,fontSize: 18),),
      ),

      body:reviewCartProvider.getReviewCartDataList.isEmpty?Center(child: Text("NO CART SELECTED", style:  TextStyle(color: Colors.red),),):ListView.builder(
         itemCount: reviewCartProvider.getReviewCartDataList.length,
          itemBuilder:(context, index) {
           ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
            return Column(
              children: [
                SizedBox(height: 10,),
                SingleItem(
                  isbool: true,
                  favList: false,
                  productName: data.cartName,
                  productPrice: data.cartPrice,
                  productImage: data.cartImage,
                  productId: data.cartId,
                  productQuantity: data.cartQuantity,
                  productUnit: data.cartUnit,
                  onDelete: (){
                    showAlertDialog(context, data );
                  },
                ),
                SizedBox(height: 10,),

              ],

            );

          },


      ),
    );
  }
}
