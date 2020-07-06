import'package:flutter/material.dart';
import 'package:studentorient/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:studentorient/screens/outline.dart';



class Register extends StatefulWidget {
  static String id = 'Register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  bool showSpinner=false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
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
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Email/School ID'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
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
                      onPressed: () async{

                        setState(() {
                          showSpinner=true;
                        });


                        try {
                          final newUser = await _auth
                              .createUserWithEmailAndPassword(
                              email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, MyApp.id);
                          }

                          setState(() {
                            showSpinner = false;
                          });
                        }
                        catch(e){
                          print(e);
                        }
                        //Navigator.of(context).pushReplacementNamed(MyApp.id);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
