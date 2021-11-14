
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/icon/icon_widget.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';


/// custom widget to build the settings tile responsible for Language Switch
class Language extends StatefulWidget {
  Language({Key? key}) : super(key: key);

  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return DropDownSettingsTile(
      tileColor: Theme.of(context).backgroundColor,
      leading: IconWidget(icon: Icons.translate_rounded, color: Theme.of(context).accentColor),
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
  }
}