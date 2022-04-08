import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  @override
  State<Dashboard> createState() => _dashboardPageState();
}
class _dashboardPageState extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text("Dashboard"),
        ],
      ),
    );
  }

}