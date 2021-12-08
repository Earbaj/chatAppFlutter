import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Message_Bottom_Design extends StatefulWidget {
  const Message_Bottom_Design({Key? key}) : super(key: key);

  @override
  _Message_Bottom_DesignState createState() => _Message_Bottom_DesignState();
}

class _Message_Bottom_DesignState extends State<Message_Bottom_Design> {
  final controler = TextEditingController();
  var _enterMesssage = "";
  void _sendMesssage()async{
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser;
    DocumentSnapshot<Map<String, dynamic>> users = await FirebaseFirestore.
    instance.
    collection('users').doc(user?.uid).get();
    FirebaseFirestore.instance.collection('message').add({
      'name' : _enterMesssage,
      'createAt' : Timestamp.now(),
      'userId' : user?.uid,
      'UserName' : users['userName'],
    });
    controler.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controler,
              decoration: InputDecoration(
                labelText: "Enter a message",
              ),
              onChanged: (value){
                setState(() {
                  _enterMesssage = value;
                });
              },
            ),
          ),
          IconButton(onPressed: _enterMesssage.trim().isEmpty ? null:(){
            _sendMesssage();
          },
              icon: Icon(Icons.send)
          ),
        ],
      ),
    );
  }
}
