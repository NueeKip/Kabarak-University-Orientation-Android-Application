import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Avatar extends StatelessWidget {
  final String avatarUrl;
  final Function onTap;

  const Avatar({this.avatarUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: CircleAvatar(
          radius: 60.0,
          backgroundImage: AssetImage('images/bg.jpg'),),
//
//        :CircleAvatar(
//          radius: 60.0,
//          backgroundImage: NetworkImage(avatarUrl),
//        ),
      ),
    );
  }
}
