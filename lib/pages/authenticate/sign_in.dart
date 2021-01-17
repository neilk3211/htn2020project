

import 'package:flutter/material.dart';
import 'package:htn2020project/services/auth.dart';
import 'package:htn2020project/shared/constants.dart';
import 'package:htn2020project/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state 
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(backgroundColor: Colors.blue[800],
        elevation: 0.0,
        title: Text('Sign in to TL Squared'),
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          }, 
          icon: Icon(Icons.person), 
          label: Text('Register')
          )
        ],
      ),
      body: Container( 
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(  
            children: [
              SizedBox(height:20),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'enter an email' : null,
                onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                },
              ),
              SizedBox(height:20),
              TextFormField( 
                decoration: textInputDecoration.copyWith(hintText: 'password'), 
                validator: (val) => val.length < 6 ? 'enter a 6 char min password' : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height: 20),
              RaisedButton( 
                color: Colors.blue,
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'could not sign in';
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              Text(error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              )
            ],
          ),
        )
      ),
    );
  }
}