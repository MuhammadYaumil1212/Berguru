import 'package:berguru_app/Views/dashboard_page.dart';
import 'package:berguru_app/Views/home_page.dart';
import 'package:berguru_app/Views/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget{
  @override
  State<SignInPage> createState() => _signInPageState();
}

class _signInPageState extends State<SignInPage>{
  //Form Key
  final _formKey = GlobalKey<FormState>();
  //Editing Controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  //firebase
  final _auth = FirebaseAuth.instance;
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              buildTextfield("Email",false,true),
                              buildTextfield("Password",true,false),
                              SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: (){
                                  signIn(emailController.text,
                                      passwordController.text);
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
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context){
                                              return SignUpPage();
                                            }),
                                          );
                                        },
                                        child: Text(
                                            "SignUp",
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
      child: TextFormField(
        autofocus: false,
        controller: isEmail ? emailController : passwordController,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            if(isEmail){
            //  Reg Expression for email validation
              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                return ("Please Enter a valid email");
              }
              return ("Please Enter Email");
            }
            if(isPassword){
              return("password is required for login");
            }
          }
          if(isPassword){
            if(!regex.hasMatch(value)){
              return "Please enter valid password (min: 6 character)";
            }
          }
        },
        onSaved: (value){
          isEmail ? emailController.text = value! :
          passwordController.text = value!;
        },
        textInputAction: isEmail ? TextInputAction.next : TextInputAction.done,
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
//  Login function
    void signIn(String email, String password)async{
      if(_formKey.currentState!.validate()){
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successfull! "),
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => Dashboard()
            ),
          ),
        }).catchError((e){
          Fluttertoast.showToast(msg: e!.message);
        });

      }
    }
}