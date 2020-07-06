import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Location extends StatefulWidget {
  static String id = 'location_screen';

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF993133),
    title: const Text('KABARAK UNIVERSITY'),),
      body:WebView(

        initialUrl: 'https://www.google.com/maps/d/u/0/viewer?msa=0&mid=1IEK8UeqNp4Svj9PmOGgBmqRBQw0&ll=-0.16940000033881422%2C35.966438499999995&z=16',
          javascriptMode: JavascriptMode.unrestricted,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {

        },
        child:Icon(Icons.navigation),
        backgroundColor: Color(0xFF993133),
      ),
      );
  }
}
