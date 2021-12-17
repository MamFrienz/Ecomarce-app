// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Widget SingleProducts(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 230,
      width: 150,
      decoration: BoxDecoration(
        color: Color(0xFFE3F2FD),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.network(
                  'https://pngimg.com/uploads/dog_food/dog_food_PNG9.png')),
          Expanded(
            child: Column(
              children: [
                Text('মেজবানী গোশত',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                Text('৮০০৳ মাত্র',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.redAccent)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 2),
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          border:
                          Border.all(color: Colors.blueGrey),
                          //color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '৫০০ গ্রাম',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                              ),
                            ),
                            Center(
                                child: Icon(Icons.arrow_drop_down,
                                    size: 25,
                                    color: Colors.greenAccent)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          //border: Border.all(color:Colors.blueGrey),
                          //color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.remove_circle,
                              color: Colors.orangeAccent,
                            ),
                            Text(
                              '১',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            Icon(
                              Icons.add_circle,
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.green.shade100,
        //title: const Text("Bindaaz Shopping"),
        title: const Text(
          "গোশত খেলে আসেন!",
          style: TextStyle(color: Colors.redAccent),
        ),
        actions: const [
          CircleAvatar(
            child: Icon(
              Icons.search,
              size: 18,
              color: Colors.amber,
            ),
            radius: 12,
            backgroundColor: Color(0xFFE3F2FD),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
          ),
          CircleAvatar(
            child: Icon(
              Icons.shopping_basket,
              size: 18,
              color: Colors.amber,
            ),
            radius: 12,
            backgroundColor: Color(0xFFE3F2FD),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                //color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i1.wp.com/blog.hellofresh.com/wp-content/uploads/2017/04/HF170321_ExtraShot_47_DE_Colorful-veggie-recipes-from-the-oven-49-1_low.jpg?resize=1024%2C683&ssl=1")),
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
                          padding: const EdgeInsets.only(
                              right: 321, left: 4, top: 00),
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
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Center(
                                child: Text('Get 1 with 30% offer',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        shadows: const [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 3,
                                            //offset: Offset(2,2),
                                          ),
                                        ])),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            '30% OFF',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[100]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'All Products',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProducts(),
                  SingleProducts(),
                  SingleProducts(),
                  SingleProducts(),
                  SingleProducts(),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Biriani',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProducts(),
                  SingleProducts(),
                  SingleProducts(),
                  SingleProducts(),
                  SingleProducts(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
