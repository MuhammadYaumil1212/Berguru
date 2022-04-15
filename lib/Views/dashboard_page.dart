import 'package:berguru_app/Models/user_model.dart';
import 'package:berguru_app/Views/signin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget{
  @override
  State<Dashboard> createState() => _dashboardPageState();
}
class _dashboardPageState extends State<Dashboard>{
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get()
        .then((value){
          this.loggedInUser = UserModel.fromMap(value.data());
          setState((){});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1/5,
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
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15
                        ),
                        child: Text(
                          "Good Afternoon,",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 0.1
                        ),
                        child: Text(
                          "${loggedInUser.getNickName()}!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30
                    ),
                    child: Column(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.bell,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void>logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=> SignInPage())
    );
  }

}