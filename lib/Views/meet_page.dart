import 'package:berguru_app/Models/session_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class Meet extends StatefulWidget{
  @override
  State<Meet> createState() => _Meet();
}
class _Meet extends State<Meet>{
  bool _expanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ExpansionPanelList(
            children: [
              ExpansionPanel(
                  headerBuilder: (context,isOpen){
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Upcoming Sessions",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    );
                  },
                  body: Column(
                    children: [
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
                                                    FaIcon(FontAwesomeIcons.clock),
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
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {  },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 12
                                                ),
                                                primary: Color(0xff678BE3)
                                            ),
                                            child: Text("Reschedule"),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextButton(
                                              onPressed: (){},
                                              child: Row(
                                                children: <Widget>[
                                                  Image.asset("assets/icons/gmeet.png"),
                                                  Gap(10),
                                                  Text("Join Now"),
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  isExpanded:_expanded,
                  canTapOnHeader: true
              ),
              ExpansionPanel(
                  headerBuilder: (context,isOpen){
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "All Sessions",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    );
                  },
                  body: Column(
                    children: [
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
                                                    FaIcon(FontAwesomeIcons.clock),
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
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {  },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 12
                                                ),
                                                primary: Color(0xff678BE3)
                                            ),
                                            child: Text("Reschedule"),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextButton(
                                              onPressed: (){},
                                              child: Row(
                                                children: <Widget>[
                                                  Image.asset("assets/icons/gmeet.png"),
                                                  Gap(10),
                                                  Text("Join Now"),
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  isExpanded:_expanded,
                  canTapOnHeader: true
              ),
            ],
            expansionCallback: (int index, bool isExpanded){
              _expanded = !_expanded;
              setState((){});
            },
          ),
        ],
      ),
    );
  }

}