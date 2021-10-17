import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/widget/icon/icon_widget.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter_1/utils/getText.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? photoTaken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: BackButton(),
        title: Text(getText('profile').toString()),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImageFromCamera(context: context);
                  },
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(17)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        photoTaken == null
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
                                        image: Image.file(photoTaken!).image)),
                                height: 100,
                                width: 100,
                              ),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: 350,
              padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(17)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(getText('personalInformation').toString(),
                      style: TextStyle(
                          color: Theme.of(context).textSelectionColor,
                          fontSize: 23)),
                  Row(
                    children: [
                      Text(getText('firstName').toString() + ': Marine',
                          style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                              fontSize: 20)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(getText('lastName').toString() + ': Lepen',
                          style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                              fontSize: 20)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(getText('username').toString() + ': lamarinade',
                          style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                              fontSize: 20)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          getText('email').toString() +
                              ': marine.lepen@test.com',
                          style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                              fontSize: 20)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            buildLanguage(),
            buildDarkMode(),
          ],
        ),
      ),
      bottomNavigationBar: new Footer(page: "profile"),
    );
  }

  Widget buildLanguage() => DropDownSettingsTile(
        tileColor: Theme.of(context).textSelectionColor,
        leading: IconWidget(
            icon: Icons.translate_rounded,
            color: Theme.of(context).accentColor),
        settingKey: 'key-language',
        title: getText('language').toString(),
        selected: 1,
        values: <int, String>{
          1: 'English',
          2: 'Français',
        },
        onChange: (language) {
          translation = Settings.getValue<int>('key-language', 1);
          setState(() {});
        },
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        tileColor: Theme.of(context).textSelectionColor,
        settingKey: 'key-dark-mode',
        title: getText('darkTheme').toString(),
        leading: IconWidget(
            icon: Icons.dark_mode, color: Theme.of(context).accentColor),
        onChange: (isDarkMode) {
          EasyDynamicTheme.of(context).changeTheme();
          setState(() {});
        },
      );

  Future pickImageFromCamera({
    required BuildContext context,
  }) async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      photoTaken = File(image!.path);
    });
  }
}
