import 'package:berguru_app/view/splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget{
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
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return SplashScreen();
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
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset("assets/Images/bekerja_bersama.png"),
              Text(
                "Berkembang Bersama",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2D3168)
                ),
              ),
              Flexible(
              child: RichText(
                textAlign: TextAlign.center,
                 text: TextSpan(
                   style: TextStyle(
                     height: 2,
                     fontSize: 18,
                     color: Color(0xff2D3168)
                   ),
                   text: "Disini kamu bisa menjadi guru untuk murid di seluruh "
                       "Indonesia!",
                 ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 12
                    ),
                    primary: Color(0xff678BE3)
                  ),
                  child: Text("Start")
              ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
