import 'package:berguru_app/view/dashboard_page.dart';
import 'package:berguru_app/view/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget{
  @override
  State<SignInPage> createState() => _signInPageState();
}

class _signInPageState extends State<SignInPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2/5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff5E76DA),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/Logo/berguru_logo_2.png"),
                SizedBox(height: 15),
                Container(
                  height: 380,
                  width: MediaQuery.of(context).size.width-40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2D3168)
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: <Widget>[
                            buildTextfield("Email",false,true),
                            buildTextfield("Password",true,false),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>
                                      Dashboard()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 12
                                ),
                                primary: Color(0xff678BE3),
                              ),
                              child: Text("Sign In"),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "already have account ?",
                                      style: TextStyle(
                                          color: Color(0xfff666666)
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "SignUp",
                                              style: TextStyle(
                                                  color: Color(0xfff666666)
                                              ),
                                              recognizer: new TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.push(context,
                                                    MaterialPageRoute(builder: (context){
                                                      return SignUpPage();
                                                    }),
                                                  );
                                                },
                                            ),
                                          ]
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "or continue with",
                  style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 15
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          Image.asset("assets/icons/google.png"),
                      ],
                    ),
                    SizedBox(width: 20,height: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          Image.asset("assets/icons/facebook.png"),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildTextfield(String hintText,bool isPassword, bool isEmail){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14,color: Colors.grey),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}