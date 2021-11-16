import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Holds the clickable buttons visible on top of the ListView.builder in the Community Page
class CategoryButton extends StatefulWidget {
  final String category;

  CategoryButton({Key? key, required this.category}) : super(key: key);

  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
            onPressed: () {},
            child: Text(widget.category),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>((Theme.of(context).cardColor)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))))));
  }
}
