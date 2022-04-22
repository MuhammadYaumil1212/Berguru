import 'package:berguru_app/Views/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ProfileGuru extends StatefulWidget{
  @override
  State<ProfileGuru> createState() => _ProfileGuru();
}
class _ProfileGuru extends State<ProfileGuru>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff678BE3),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white70
        ),
        elevation: 0.0,
        backgroundColor: Color(0xfff678BE3),
        title: Text(
          "Profil Guru",
          style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 22
          ),
        ),
        centerTitle: true,

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: MediaQuery.of(context).size.height * 1/3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network("https://dummyimage.com/80x80/000/fff"),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
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
                                                    Chat()),
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
                                            child: Text("Chat"),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "Summary",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}