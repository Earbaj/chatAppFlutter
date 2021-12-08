import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_list.dart';
import 'message_text_button_design.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
        child: Column(
          children: [
            Expanded(child: MessageList()),
            Message_Bottom_Design(),
          ],
        ),
      ),
    );
  }
}
