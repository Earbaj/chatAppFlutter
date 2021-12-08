import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Message extends StatelessWidget {
  final auth = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context){
    return FutureBuilder<User?>(
      initialData: auth,
      builder: (ctx, futureSnapshot){
        if(futureSnapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        return StreamBuilder<QuerySnapshot?>(
            stream: FirebaseFirestore.
            instance.
            collection('message').
            orderBy('createAt', descending: true).snapshots(),
            builder: (ctx, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              final document = snapshot.data?.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    reverse: true,
                    itemCount: document?.length,
                    itemBuilder: (ctx, index){
                      return document == null ? Text("Null") :
                      Message_Design(
                        document[index]['name'],
                        document[index]['UserName'],
                        document[index]['userId'] == futureSnapshot.data?.uid,
                      );
                    }
                ),
              );
            }
        );
      },
    );
  }
}