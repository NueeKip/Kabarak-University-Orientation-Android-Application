import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentorient/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:studentorient/screens/outline.dart';
import 'outline.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {

                          email = value;

                      },
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Email/School ID'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      onChanged: (value) {

                          password = value;

                      },
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Password'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 50.0,
                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 7.0,
                        color: Color(0xFF993133),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white70),
                          ),
                      onPressed:()async
    {


    setState(()
    {
    showSpinner=true;
    }
    );

    try
    {
    final user = await _auth.signInWithEmailAndPassword(email:email, password:password);
    if(user != null){
    Navigator.of(context).pushReplacementNamed(MyApp.id);
    }
    setState(()
    {
    showSpinner=false;
    }
    );
    }
                        catch(e){
                            print(e);
                          }
                      }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
