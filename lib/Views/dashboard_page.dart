import 'package:berguru_app/Views/chat_page.dart';
import 'package:berguru_app/Views/home_page.dart';
import 'package:berguru_app/Views/meet_page.dart';
import 'package:berguru_app/Views/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget{
  @override
  State<Dashboard> createState() => _dashboardPageState();
}
class _dashboardPageState extends State<Dashboard>{
  int currentIndex = 0;
  final screens = [
    HomePage(),
    Meet(),
    Chat(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index)=> setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'beranda',
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.video),
              label: 'video Call',
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.comment),
              label: 'chat',
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userGroup),
              label: 'friends',
              backgroundColor: Colors.blueAccent
          ),
        ],
      ),
    );
  }
  // Future<void>logout(BuildContext context) async{
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (context)=> SignInPage())
  //   );
  // }

}