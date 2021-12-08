import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_text_button_design.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: [
          TextButton.icon(
          onPressed: ()async{
            await FirebaseAuth.instance.signOut();
          },
          icon: Icon(Icons.follow_the_signs_outlined,color: Colors.black,),
          label: Text("Log out",style: TextStyle(color: Colors.black),)),
        ],
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Message_Bottom_Design(),
      ),
    );
  }
}
