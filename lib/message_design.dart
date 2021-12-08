import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message_Design extends StatelessWidget {
final String message;
final bool isMe;
final String userName;

Message_Design(
    this.message,
    this.userName,
    this.isMe,
    );

@override
Widget build(BuildContext context) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment:
      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 140.0,
          decoration: BoxDecoration(
            color: Colors.amber.shade400,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(userName),
                Text(message),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}