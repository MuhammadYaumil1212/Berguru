import 'package:flutter/material.dart';

class Chat extends StatefulWidget{
  @override
  State<Chat> createState() => _chatPage();
}
class _chatPage extends State<Chat>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: const [
              Text("Chat Page"),
            ],
          ),
        ],
      ),
    );
  }

}