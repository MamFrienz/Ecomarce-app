//import 'package:eco_app/home%20Screen/homescreen.dart';
//import 'package:eco_app/account/account.dart';

//import 'package:eco_app/home%20Screen/homescreen.dart';
//import 'package:eco_app/Authentication/sign_in.dart';
import 'package:eco_app/providers/checkoutProvider.dart';
import 'package:eco_app/providers/favouritelistprovider.dart';
import 'package:eco_app/providers/productprovider.dart';
import 'package:eco_app/providers/reviewcartprovider.dart';
import 'package:eco_app/providers/userprovider.dart';
import 'package:eco_app/splashscreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:eco_app/splashscreen.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:eco_app/splashscreen.dart';
//import 'package:eco_app/home%20Screen/product%20View/productview.dart';
//import 'package:eco_app/home%20Screen/product%20View/productview.dart';
//import 'package:eco_app/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

//import 'Authentication/sign_in.dart';

import 'Config/colors.dart';
import 'home Screen/homescreen.dart';
//import 'home Screen/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
              create: (context) => ProductProvider()),
          ChangeNotifierProvider<UserProvider>(
              create: (context) => UserProvider()),
          ChangeNotifierProvider<ReviewCartProvider>(
              create: (context) => ReviewCartProvider()),
          ChangeNotifierProvider<FavouriteListProvider>(
              create: (context) => FavouriteListProvider()),
          ChangeNotifierProvider<CheckOutProvider>(
              create: (context) => CheckOutProvider()),
        ],
        child: MaterialApp(
            title: 'Eco App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
              primaryColor: primaryColor,
              // visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const HomeScreen();
                }
                return const SplashScreen();
              },
            )));
  }
}
