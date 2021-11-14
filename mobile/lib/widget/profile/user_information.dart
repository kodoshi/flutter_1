

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/model/profile.dart';
import 'package:flutter_1/utils/globalVars.dart';

class UserInformation extends StatefulWidget {
  final Profile profile;

  UserInformation({Key? key, required this.profile}) : super(key: key);

  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 350,
      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
      decoration:
      BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(17)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(getText('personalInformation').toString(),
              style: TextStyle(color: Colors.white, fontSize: 23)),
          Text(getText('firstName').toString() + ': ${widget.profile.name}',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text(getText('lastName').toString() + ': ${widget.profile.surname}',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text(getText('email').toString() + ': ${widget.profile.email}',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }
}