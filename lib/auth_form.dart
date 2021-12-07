import 'dart:io';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
      final void Function(
          String email,
          String password,
          String username,
          bool islogin,
          BuildContext ctx) submitAuthForm;


      AuthForm(this.submitAuthForm);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //Form key
  final _formKey = GlobalKey<FormState>();
  //Variables
  bool _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final validate = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validate) {
      _formKey.currentState!.save();
      widget.submitAuthForm(_userEmail, _userPassword, _userName, _isLogin, context);
    }
  }

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
                        _trySubmit();
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
