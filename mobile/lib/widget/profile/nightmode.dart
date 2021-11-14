import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/icon/icon_widget.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

/// custom widget to build the settings tile responsible for Dark Theme Switch
class NightMode extends StatefulWidget {
  NightMode({Key? key}) : super(key: key);

  _NightModeState createState() => _NightModeState();
}

class _NightModeState extends State<NightMode> {
  @override
  Widget build(BuildContext context) {
    return SwitchSettingsTile(
      tileColor: Theme.of(context).backgroundColor,
      settingKey: 'key-dark-mode',
      title: getText('darkTheme').toString(),
      leading: IconWidget(icon: Icons.dark_mode, color: Theme.of(context).accentColor),
      onChange: (isDarkMode) {
        EasyDynamicTheme.of(context).changeTheme();
        setState(() {});
      },
    );
  }
}