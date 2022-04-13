import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  @override
  State<Dashboard> createState() => _dashboardPageState();
}
class _dashboardPageState extends State<Dashboard>{
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
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      Column(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              text: "Good Afternoon!",
                              style: TextStyle(

                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}