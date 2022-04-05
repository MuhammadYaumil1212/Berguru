import 'package:berguru_app/view/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5D8EE2),
      body:GestureDetector(
        onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return StartPage();
            }),
          );
        },
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