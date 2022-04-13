import 'package:berguru_app/view/dashboard_page.dart';
import 'package:berguru_app/view/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{
  //Form Key
  final _formKey = GlobalKey<FormState>();
  //Form Controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              buildTextfield("Nama",false,false,false),
                              buildTextfield("Email",false,false,true),
                              buildTextfield("Password",true,false,false),
                              buildTextfield("Confirm Password",false,true,false),
                              SizedBox(height: 15),
                              ElevatedButton(
                                  onPressed: (){},
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
                              SizedBox(height: 10),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Column(
                                   children: const [
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
                                     GestureDetector(
                                       onTap: (){
                                         Navigator.pushReplacement(context,
                                           MaterialPageRoute(builder: (context){
                                             return SignInPage();
                                           }),
                                         );
                                       },
                                       child: const Text(
                                           "SignIn",
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           color: Color(0xff678BE3),
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ],
                             )
                            ],
                          ),
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
  Widget buildTextfield(String hintText,bool isPassword,bool isConfirmPassword,
      bool isEmail){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: false,
        controller: (isEmail) ? emailController : (isPassword) ? passwordController
        : nameController,
        // validator: (),
        onSaved: (value){
          (isEmail) ? emailController.text = value! : (isPassword)
              ? passwordController.text = value! : (isConfirmPassword)
              ? confirmPasswordController.text = value! : nameController.text = value!;
        },
        obscureText: isPassword || isConfirmPassword,
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