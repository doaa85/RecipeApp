import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/enter_page.pages.dart';
import 'package:recipe_app/pages/home_page.pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription<User?>? _listener;
  @override
  void initState() {
    super.initState();
    initSplash();
  }

  void initSplash() async {
    // await Future.delayed(const Duration(seconds: 1));
    // // if (GetIt.I.get<SharedPreferences>().getBool('isLogin') ?? false) {
    // if (false) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (_) => HomePage()));
    // } else {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (_) => EnterPage(),
    //       ));
    // }
    await Future.delayed(const Duration(seconds: 1));
    _listener = FirebaseAuth.instance.authStateChanges().listen((User) {
      if (User == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => EnterPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));
      }
    });
  }

  @override
  void dispose() {
    _listener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
         const   Image(
              image: AssetImage(
                'assets/images/Mask Group 9.png',
              ),
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
              width: double.infinity,
              height: double.infinity,
            ),
          const  SizedBox(
              height: 100,
            ),
            Container(
              padding:const EdgeInsets.fromLTRB(85, 130, 0, 0),
              child: const Image(
                image: AssetImage('assets/images/Logo (2).png'),
                color: Colors.black12,
                colorBlendMode: BlendMode.darken,
                width: 200,
                height: 200,
              ),
            ),
          const  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                  child: Text(
                    'Cooking Done The Easy Way',
                    style: TextStyle(
                        color: Colors.white54,
                        fontFamily: "Hellix ",
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          const  CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
