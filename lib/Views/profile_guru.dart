import 'package:flutter/material.dart';

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
      ),
    );
  }

}