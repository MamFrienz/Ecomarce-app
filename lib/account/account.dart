import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/home%20Screen/drawerScreen.dart';

import 'package:eco_app/providers/userprovider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAccount extends StatefulWidget {
  late UserProvider userProvider;
  MyAccount({Key? key, required this.userProvider}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Text(
          "My Account",
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
      drawer: DrawerScreen(userProvider: widget.userProvider),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 548,
                width: double.infinity,
                //color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackGroColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData.userName,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    userData.userEmail,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.white70,
                                  child: Icon(
                                    Icons.edit,
                                    size: 17,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(icon: Icons.shop_2_outlined, title: "My Orders"),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: " Delievery Location"),
                    listTile(
                        icon: Icons.add_shopping_cart_outlined,
                        title: "Product Cart"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions"),
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy Policy"),
                    listTile(
                        icon: Icons.person_outlined,
                        title: "Refer with Friends"),
                    listTile(
                        icon: Icons.exit_to_app_outlined,
                        title: "Exit / LogOut"),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.yellow,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white70,
                backgroundImage: NetworkImage(
                  "https://media-exp1.licdn.com/dms/image/C5603AQHDQ_oVkxVWHg/profile-displayphoto-shrink_200_200/0/1568791246365?e=1648080000&v=beta&t=tr-KeUW8TX1qfnu1o0kmvgi7rvkgcuw45WSnwDt2mbk",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
