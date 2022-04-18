import 'package:berguru_app/Models/user_model.dart';
import 'package:berguru_app/Views/match_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
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
      body: ListView(
        children: <Widget>[
          Stack(
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
                                vertical: 30
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
                            ),
                            child: Text(
                              "${loggedInUser.getNickName()}!",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 0
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 10
                        ),
                        child: Column(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.bell,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25
                ),
                child: Text(
                  "Cari Kebutuhanmu Disini!",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 0
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 20,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Colors.grey,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Colors.grey,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Cari Kebutuhanmu",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: Color(0xfff678BE3),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Find a best Teacher \n that suits you!",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                    Gap(40),
                                    InkWell(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Book Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => MatchPage(),
                                            ),
                                          );
                                        });
                                      },
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset("assets/Images/book.png")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(5),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: Color(0xfff678BE3),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Learn with live \n video call...",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset("assets/Images/book.png"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Modul Bank",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10
                  ),
                  child: Row(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Color(0xfffEF5DA8),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/biologi.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Color(0xfffAEAFF7),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/english.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Color(0xfff8ED8D7),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/geografi.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Color(0xfffF09E54),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/fisika.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                // Padding(),
              ],
            ),
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Article",
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: 15
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Gap(10),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal:10,
                    vertical: 10
                ),
                child: ListTile(
                  tileColor: Color(0xfffF7F7F7),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/Images/article.png")
                  ),
                  title : Text(
                      "Tips Persiapan UTBK 2022 : \n "
                          "Temukan Modul Materimu disini"
                  ),
                  subtitle: Text("Tips & Trick"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}