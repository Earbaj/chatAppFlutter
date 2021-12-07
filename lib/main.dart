import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth_form.dart';
import 'authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Authentication(),
      ),
    );
  }
}
