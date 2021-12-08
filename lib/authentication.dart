import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_form.dart';
import 'message_screen.dart';

final _auth = FirebaseAuth.instance;

class Authentication extends StatefulWidget {

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  //Function to sign_in or register new user
  void _submitAuthForm(
      String email,
      String password,
      String username,
      bool islogin,
      BuildContext ctx)async{
    UserCredential userCredential;
    try{
      if(islogin){
        //sign in methode
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }else{
        //create user methode
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance.
        collection('users').
        doc(userCredential.user!.uid).set({
          'email' : email,
          'userName' : username
        });
      }
    }catch(error){
      Scaffold.of(ctx).showSnackBar(
          SnackBar(content: Text(error.toString()))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapShot){
          if(snapShot.hasData){
            return MessageScreen();
          }
          return AuthForm(_submitAuthForm);
        },
      ),
    );
  }
}
