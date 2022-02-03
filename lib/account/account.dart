import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/home%20Screen/drawerScreen.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("My Account"),
      ),
      drawer: DrawerScreen(

      ),
    );
  }
}
