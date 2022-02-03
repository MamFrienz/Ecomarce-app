import 'dart:ui';
import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/home%20Screen/drawerScreen.dart';
import 'package:eco_app/home%20Screen/product%20View/productview.dart';
import 'package:eco_app/home%20Screen/singleProduct.dart';
import 'package:eco_app/providers/productprovider.dart';
import 'package:eco_app/providers/userprovider.dart';
import 'package:eco_app/reviewCart/reviewcart.dart';
import 'package:eco_app/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;

  Widget _makeAllProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Products',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getmakeAllProductDataList,
                          )));
                },
                child: const Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getmakeAllProductDataList
                .map((makeAllProductList) {
              return SingleProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductView(
                        productId: makeAllProductList.productId,
                        productImage: makeAllProductList.productImage,
                        productName: makeAllProductList.productName,
                        productPrice: makeAllProductList.productPrice,
                      ),
                    ),
                  );
                },
                productId: makeAllProductList.productId,
                productImage: makeAllProductList.productImage,
                productName: makeAllProductList.productName,
                productPrice: makeAllProductList.productPrice,
                productUnit: makeAllProductList,
              );
            }).toList(),
            // children: [

            //
            // ],
          ),
        ),
      ],
    );
  }

  Widget _birianiProduct(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Biriani',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                          search: productProvider.getbirianiProductListData)));
                },
                child: const Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getbirianiProductListData.map(
              (birianiProductList) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductView(
                          productId: birianiProductList.productId,
                          productImage: birianiProductList.productImage,
                          productName: birianiProductList.productName,
                          productPrice: birianiProductList.productPrice,
                        ),
                      ),
                    );
                  },
                  productId: birianiProductList.productId,
                  productImage: birianiProductList.productImage,
                  productName: birianiProductList.productName,
                  productPrice: birianiProductList.productPrice,
                  productUnit: birianiProductList,
                );
              },
            ).toList(),
            // children: [

            //
            // ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    // TODO: implement initState
    initproductProvider.fatchbirianiProductData();
    initproductProvider.fatchmakeAllProductData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider;
    // void initState() {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();

    //   // TODO: implement initState
    //   productProvider.fatchmakeAllProductData();
    //   super.initState();
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerScreen(userProvider: userProvider),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.green.shade100,
        //title: const Text("Bindaaz Shopping"),
        title: Text(
          "গোশত খেলে আসেন!",
          style: TextStyle(color: Colors.redAccent),
        ),
        actions: [
          CircleAvatar(
            //radius: 12,
            backgroundColor: appbarCircleAColor,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                          search: productProvider.getallProductDataList,
                        )));
              },
              icon: Icon(
                Icons.search,
                size: 18,
                color: Colors.amber,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ReviewCart()));
            },
            child: CircleAvatar(
              child: Icon(
                Icons.shopping_basket,
                size: 18,
                color: Colors.amber,
              ),
              radius: 12,
              backgroundColor: appbarCircleAColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                //color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.euractiv.com/wp-content/uploads/sites/2/2020/01/shutterstock_1031664748-800x450.jpg")),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      // flex:2,
                      child: Container(
                    //color: Colors.red,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: 321, left: 4, top: 00),
                          child: Container(
                            height: 85,
                            decoration: BoxDecoration(
                                color: Colors.purpleAccent,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                )),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Center(
                                  // child: Text('Get 1 with 30% offer',
                                  //     style: TextStyle(
                                  //         color: Colors.amber,
                                  //         fontSize: 16,
                                  //         fontWeight: FontWeight.bold,
                                  //         shadows: [
                                  //           BoxShadow(
                                  //             color: Colors.white,
                                  //             blurRadius: 3,
                                  //             //offset: Offset(2,2),
                                  //           ),
                                  //         ])),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            '30% OFF',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[100]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            'Happy Shopping with us',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            _makeAllProduct(context),
            _birianiProduct(context),
          ],
        ),
      ),
    );
  }
}
