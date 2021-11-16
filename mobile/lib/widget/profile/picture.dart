import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/bloc/profile/bloc.dart';
import 'package:flutter_1/bloc/profile/event.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:image_picker/image_picker.dart';

/// custom widget that displays and has upload functionality over a selected picture
class Picture extends StatefulWidget {
  final ProfilesBloc profileBloc;
  final String image;

  Picture({Key? key, required this.profileBloc, required this.image}) : super(key: key);

  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  /// async function taking care of image upload through camera
  Future _pickImageFromCamera({
    required BuildContext context,
  }) async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    print(image!.path);
    final photoTaken = File(image.path);

    widget.profileBloc.profileEventSink.add(ProfileUpdateEvent(image: photoTaken.path));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImageFromCamera(context: context);
      },
      child: Container(
        height: 140,
        width: 150,
        decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(17)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.image.isEmpty
                ? Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Theme.of(context).canvasColor,
                  )
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.file(File(widget.image)).image,
                      ),
                    ),
                    height: 100,
                    width: 100,
                  ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text(
                getText('tapToAdd').toString(),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
