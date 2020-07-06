import 'package:flutter/material.dart';
import 'package:studentorient/screens/register.dart';
import 'package:studentorient/screens/home.dart';
import 'package:studentorient/screens/location.dart';
import 'package:studentorient/screens/profile.dart';
import 'package:studentorient/screens/signin.dart';
import 'package:studentorient/screens/outline.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized();
//  setupServices();
  runApp(MaterialApp(
    home: Welcome(),
    routes: <String, WidgetBuilder>{
      Home.id: (BuildContext context) => Home(),
      Welcome.id: (BuildContext context) => Welcome(),
      Location.id: (BuildContext context) => Location(),
      Profile.id: (BuildContext context) => Profile(),
      Register.id: (BuildContext context) => Register(),
      MyApp.id: (BuildContext context) => MyApp(),
    },
  ));
}

class Welcome extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RoundedButton(
                colour: Color(0xFF993133),
                title: 'Sign In',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SignIn()));
                },
              ),
              RoundedButton(
                  colour:Color(0xFF993133),
                  title: 'Register',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Register()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({this.colour, this.title, @required this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return button();
  }

  Padding button() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 7.0,
        color: Color(0xFF993133),
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 30.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white70),
          ),
          // GoogleFonts.lato(textStyle:
        ),
      ),
    );
  }
}
