import 'package:flutter/material.dart';



const kTextFieldDecoration = InputDecoration(
   hintText: 'Enter your School ID here',
   hintStyle: TextStyle( color:Colors.deepPurple ),
   contentPadding:
   EdgeInsets.all(10.0),
   border: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(32.0)),

   ),
   enabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(32.0)),
     borderSide: BorderSide(color: Colors.white, width: 1.0),
   ),
   focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(32.0)),
     borderSide: BorderSide(color: Color(0xFF993133),width: 2.0),
   ),
 );
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xFF993133), width: 2.0),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color:Color(0xFF993133),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
