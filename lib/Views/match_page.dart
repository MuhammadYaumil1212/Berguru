import 'dart:ui';

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
          Card(

          ),
        ],
      ),
    );
  }

}