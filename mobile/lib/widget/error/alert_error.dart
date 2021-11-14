import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/bloc/common/state.dart';

class AlertError extends StatefulWidget {
  final ErrorState error;
  final Function callback;

  AlertError({Key? key, required this.error, required this.callback}) : super(key: key);

  _AlertErrorState createState() => _AlertErrorState();
}

class _AlertErrorState extends State<AlertError> {
  void _onPressed() {
    widget.callback(widget.error);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.error.title),
      content: Text(widget.error.message),
      actions: [
        TextButton(
            onPressed: () {
              _onPressed();
            },
            child: Text("Refresh"))
      ],
    );
  }
}
