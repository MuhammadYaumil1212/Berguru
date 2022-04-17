import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class Meet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            color: Color(0xfffE2EBFF),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                              "https://dummyimage.com/35x35/000/fff",
                              scale: 0.6),
                        ),
                        title: Text("Agus Budianto", style: TextStyle(fontSize: 20)),
                        subtitle:  Text("Guru Bahasa Indonesia SMAN 2 Wakanda",
                                    style: TextStyle(
                                    color: Color(0xfff787878),
                                    fontSize: 14
                        )),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        FaIcon(FontAwesomeIcons.calendarWeek),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 10
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "31 Maret 2022",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(30),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 10
                                    ),
                                    child: Column(
                                      children: [
                                        FaIcon(FontAwesomeIcons.calendarWeek),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "20:00 - 22:00",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}