
import 'package:flutter/material.dart';
import 'package:htn2020project/services/auth.dart';
import 'package:htn2020project/shared/constants.dart';
import 'package:htn2020project/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        title: Text('Sign up to TL Squared'),
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          }, 
          icon: Icon(Icons.person), 
          label: Text('Sign In')
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
                onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                },
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'enter an email' : null,
              ),
              SizedBox(height:20),
              TextFormField(  
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                validator: (val) => val.length < 6 ? 'enter a 6 char min password' : null,
                obscureText: true,
              ),
              SizedBox(height: 20),
              RaisedButton( 
                color: Colors.blue,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'please supply valid email';
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