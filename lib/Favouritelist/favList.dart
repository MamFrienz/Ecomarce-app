import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/models/productmodel.dart';
import 'package:eco_app/providers/favouritelistprovider.dart';
import 'package:eco_app/widgets/singleItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FavList extends StatefulWidget {
  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  late FavouriteListProvider favouriteListProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        favouriteListProvider.favDataDelete(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Favourite Product"),
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
    favouriteListProvider = Provider.of(context);
    favouriteListProvider.getFavListData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FavList",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: favouriteListProvider.getFavDataList.length,
        itemBuilder: (context, index) {
          ProductModel data = favouriteListProvider.getFavDataList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isbool: true,
                //i have a confuse is it true or false
                favList: false,
                productName: data.productName,
                productPrice: data.productPrice,
                productImage: data.productImage,
                productId: data.productId,
                productQuantity: 1200,
                productUnit: data.productUnit,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
