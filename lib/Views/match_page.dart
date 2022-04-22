import 'dart:ui';

import 'package:berguru_app/Views/profile_guru.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class MatchPage extends StatefulWidget{
  @override
  State<MatchPage> createState() => _MatchPage();

}
class _MatchPage extends State<MatchPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1/7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff5E76DA),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          "Match Guru",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Gap(30),
          Column(
            children: [
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
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: FaIcon(
                        FontAwesomeIcons.sliders
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              color: Color(0xfffE2EBFF),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  "https://dummyimage.com/72x70/000/fff",
                              ),
                            ),
                          ],
                        ),
                        Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Anisa Subandoyo",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                            Text(
                              "Guru Ipa SMA 1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff787878),
                                fontSize: 13
                              ),
                            ),
                            Gap(10),
                            Text(
                              "Keahlian : Fisika, Biologi",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff787878),
                                  fontSize: 13
                              ),
                            ),
                            Gap(10),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  size: 14,
                                  color: Colors.yellow,
                                ),
                                Gap(10),
                                Text("4.5"),
                                Gap(20),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 100.0,
                                  child:  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            ProfileGuru()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5
                                        ),
                                        primary: Color(0xff678BE3)
                                    ),
                                    child: Text("See More"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Gap(20),
                        Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidHeart,
                              size: 14,
                              color: Colors.red,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}