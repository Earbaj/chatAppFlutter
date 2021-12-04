import 'dart:io';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      key: ValueKey('email'),
                      onSaved: (data) {
                        _userEmail = data!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please provide an email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Email Address"),
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('name'),
                        onSaved: (data) {
                          _userName = data!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "User Name"),
                      ),
                    TextFormField(
                      key: ValueKey('password'),
                      onSaved: (data) {
                        _userPassword = data!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Please provide an password 6 latter or character';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                      },
                      child: Text(_isLogin ? "Log in" : "Sign in"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: _isLogin
                          ? Text("Create an account")
                          : Text("I already have an account"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
