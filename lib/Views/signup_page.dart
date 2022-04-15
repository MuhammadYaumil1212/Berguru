import 'package:berguru_app/Models/user_model.dart';
import 'package:berguru_app/Views/dashboard_page.dart';
import 'package:berguru_app/Views/signin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{
  final _auth = FirebaseAuth.instance;
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
                  height: 500,
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
                        padding: const EdgeInsets.symmetric(vertical:15),
                        width: 300,
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
                                  onPressed: (){
                                    signUp(nameController.text, emailController.text,
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
                                  child: Text("Sign Up"),
                              ),
                              SizedBox(height: 10),
                             Row(
                               mainAxisAlignment:  MainAxisAlignment.center,
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
        controller: (isEmail) ? emailController :
        (isPassword) ? passwordController : (isConfirmPassword) ? confirmPasswordController
        : nameController,
        validator: (value){
          RegExp regex = new RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            if(isEmail){
              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                return ("Please Enter a valid email");
              }
              return ("Please enter email");
            }
            if(isPassword){
              return("password is required for login");
            }
            if(isConfirmPassword){
              if(confirmPasswordController.text.length > 6
                  && passwordController.text != value){
                return "Password not match";
              }
              return null;
            }
            return("Please enter your name");
          }
          if(!regex.hasMatch(value)){
            return ("Please enter name min 6 characters");
          }
          if(isPassword){
            if(!regex.hasMatch(value)){
              return "Please enter valid password (min: 6 characters)";
            }
          }
        },
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
  void signUp(String nama, String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailToFireStore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailToFireStore() async{
  //  Calling our firestore
  //  calling our user model
  //  sending the values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
  //  writing all the values
    userModel.uid = user!.uid;
    userModel.nama = nameController.text;
    userModel.email = user.email;

    await firebaseFirestore.collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully!");
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Dashboard()),
        (route) => false
    );
  }
}