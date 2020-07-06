
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentorient/avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentorient/main.dart';
import 'package:studentorient/screens/forum.dart';

class Profile extends StatefulWidget {
  static String id = 'profile_screen';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final picker = ImagePicker();
  final _auth = FirebaseAuth.instance;

  String dropdownValue = 'Transcripts';

  List<String> dropdownItems = <String>[
    'Register Course',
    'Register Unit',
    'Transcripts',
    'Borrow Book',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF993133),
        title: const Text('KABARAK UNIVERSITY'),
      ),
      body: Column(
        children: <Widget>[
          //TODO: Image

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Avatar(
                avatarUrl: null, //currentUser?.avatarUrl,
                onTap: () async {
                  PickedFile image =
                      await picker.getImage(source: ImageSource.gallery);
//                  await locator
//                      .get<UserController>()
//                      .uploadProfilePicture(image);

                  setState(() {});
                },
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.person, size: 30.0),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Name',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 160.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.info,
                  size: 30.0,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('About',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    Text('Course of Study',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Year of Study',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.chat, size: 30.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    disabledTextColor: Colors.black,
                    child: Text('Join Forum',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder:(context){
                        return ChatScreen();
                      }));

                    },
                  )
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.school, size: 30.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: dropdownItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                  elevation: 5.0,
                  color: Color(0xFF993133),
                  textColor: Colors.white,
                  child: Text('Sign Out',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pop(context, Welcome.id);
  }),
            ],
          ),
        ],
      ),
    );
  }
}
