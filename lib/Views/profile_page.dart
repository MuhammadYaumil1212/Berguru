import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: const [
                Text("Profile"),
              ],
            ),
          ],
        ),
      ),
    );
  }

}