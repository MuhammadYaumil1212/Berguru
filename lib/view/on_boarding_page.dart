import 'package:berguru_app/view/start_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                    children: [
                      TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2D3168),
                        ),
                        text: "Skip",
                        recognizer: new TapGestureRecognizer()..onTap = () {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context){
                              return StartPage();
                            }),
                          );
                        },
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.asset("assets/Images/bekerja_bersama.png"),
            Text(
              "Temukan Mentor Guru",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2D3168)
              ),
            ),
            SizedBox(height: 12),
            Flexible(
              child: RichText(
                textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 17,
                        color: Color(0xff2D3168)
                    ),
                    text: "Disini kamu bisa menemukan guru yang akan membantu "
                        "meningkatkan pembelajaran kamu!",
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}