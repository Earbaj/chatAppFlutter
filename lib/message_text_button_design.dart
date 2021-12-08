import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final controler = TextEditingController();
  var _enterMesssage = "";
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
          },
              icon: Icon(Icons.send)
          ),
        ],
      ),
    );
  }
}
