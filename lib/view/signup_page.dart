import 'package:berguru_app/view/dashboard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{
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
                  height: 450,
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
                            "Sign Up",
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
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            buildTextfield("Nama",false,false),
                            buildTextfield("Email",false,true),
                            buildTextfield("Password",true,false),
                            buildTextfield("Confirm Password",true,false),
                            SizedBox(height: 30),
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
                                child: Text("Sign Up"),
                            ),
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
                          InkWell(
                            child: Image.asset("assets/icons/google.png"),
                            onTap: () => launch("google.com"),
                          ),
                        ],
                      ),
                    SizedBox(width: 20,height: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                        child: Image.asset("assets/icons/facebook.png"),
                          onTap: () => launch("faceook.com"),
                        ),
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