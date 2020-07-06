import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentorient/screens/study.dart';
import 'package:studentorient/screens/location.dart';
import 'package:studentorient/screens/profile.dart';
import 'package:studentorient/screens/home.dart';

class MyApp extends StatefulWidget {
  static String id ='MyApp';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  void getCurrentUser()async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser);
      }
    }
    catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavHome(),
    );
  }
}

class NavHome extends StatefulWidget {
  NavHome({Key key}) : super(key: key);

  @override
  _NavHomeState createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Study(),
    Location(),
    Profile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF993133),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Library'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Location'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
