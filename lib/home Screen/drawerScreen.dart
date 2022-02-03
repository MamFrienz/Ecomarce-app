import 'package:eco_app/Favouritelist/favList.dart';
import 'package:eco_app/account/account.dart';
import 'package:eco_app/home%20Screen/homescreen.dart';

import 'package:eco_app/providers/userprovider.dart';
import 'package:eco_app/reviewCart/reviewcart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  late UserProvider userProvider;

  DrawerScreen({required this.userProvider});
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Widget listTile(
      {required IconData icon,
      required String title,
      required Function onTap}) {
    return ListTile(
      onTap: onTap(),
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: Colors.green.shade100,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        // backgroundColor: Colors.orange,
                        backgroundImage: NetworkImage(userData.userImage
                            //"https://www.clipartkey.com/mpngs/m/71-714421_blank-profile-logo.png"
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text('Happy Shoping'),
                    //     SizedBox(height: 7,),
                    //     Container(
                    //       height: 30,
                    //       child:  OutlineButton(
                    //         child: Text('Login'),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(15),
                    //           side: BorderSide(
                    //             width: 2,
                    //           ),
                    //         ),
                    //         onPressed: (){},
                    //       ),
                    //     )
                    //   ],
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userData.userName),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              icon: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            listTile(
                icon: Icons.person_outline,
                title: "My Account",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyAccount(userProvider: widget.userProvider)));
                }),
            listTile(
              icon: Icons.notifications,
              title: "Notification",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MyAccount(userProvider: widget.userProvider)));
              },
            ),
            listTile(
                icon: Icons.shop_2_outlined,
                title: "Products",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyAccount(userProvider: widget.userProvider)));
                }),
            listTile(
                icon: Icons.add_shopping_cart,
                title: "Your orders",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyAccount(userProvider: widget.userProvider)));
                }),
            listTile(
                icon: Icons.shopping_cart,
                title: "Cart Review",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                }),
            listTile(
                icon: Icons.favorite_outline,
                title: "Favorite",
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => FavList()));
                }),
            listTile(
                icon: Icons.star,
                title: "Rating",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyAccount(userProvider: widget.userProvider)));
                }),
            listTile(
                icon: Icons.format_quote_outlined,
                title: "About",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyAccount(userProvider: widget.userProvider)));
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact Support'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Call us:'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(' +880162....866'),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('Mail us:'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('mamwithbrothers@gmail.com'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
