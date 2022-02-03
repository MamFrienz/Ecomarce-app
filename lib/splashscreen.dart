import 'dart:async';
//import 'package:eco_app/Authentication/sign_in.dart';
import 'package:eco_app/Authentication/sign_in.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

//import 'home Screen/homescreen.dart';

//import 'Authentication/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 10),
      () => Navigator.pushReplacement(
        context,
        PageTransition(child: SignIn(), type: PageTransitionType.leftToRight),
        //   child: StreamBuilder(
        //      stream: FirebaseAuth.instance.authStateChanges(),
        //      builder: (context, snapshot){
        //        if (snapshot.hasData){
        //          return HomeScreen();
        //        }
        //       return SignIn();
        //      },
        //    ), type:PageTransitionType.leftToRight
      ),

      // super.initState();
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200.0,
          width: 800.0,
          child: Lottie.asset("assets/eco_pay.json"),
        ),
        RichText(
          text: const TextSpan(
              text: 'Joga',
              style: TextStyle(
                fontSize: 56.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'K',
                    style: TextStyle(
                        fontSize: 56.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
                TextSpan(
                    text: 'hicuri',
                    style: TextStyle(
                        fontSize: 56.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ]),
        )
      ],
    ));
  }
}
