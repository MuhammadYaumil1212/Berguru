import 'dart:async';

import 'package:berguru_app/view/on_boarding_page.dart';
import 'package:berguru_app/view/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context){
            return OnBoardingPage();
          }),
        )
    );
    return Scaffold(
      backgroundColor: Color(0xff5D8EE2),
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/Logo/berguru_logo.png"),
                ],
              ),
            ),
          ),
        );
  }

}