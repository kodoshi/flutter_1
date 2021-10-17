import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/page/user_statistics.dart';
import 'package:flutter_1/page/home_page.dart';
import 'package:flutter_1/page/profile_page.dart';
import 'package:flutter_1/page/playlists_page.dart';
import 'package:flutter_1/page/community_page.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Future main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VaporWare',
      themeMode: EasyDynamicTheme.of(context).themeMode,
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(245, 245, 220, 1),
        primaryColor: Color.fromRGBO(200, 173, 127, 1),
        cardColor: Color.fromRGBO(169, 146, 123, 1),
        textSelectionColor: Colors.white,
        accentColor: Color.fromRGBO(169, 146, 123, 1),
        canvasColor: Color.fromRGBO(249, 228, 183, 1),
        bottomAppBarColor: Color.fromRGBO(200, 173, 127, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        backgroundColor: Color.fromRGBO(22, 35, 57, 1 /**/),
        primaryColor: Color.fromRGBO(28, 46, 74, 1 /**/),
        cardColor:
            Colors.black26, //Color.fromRGBO(17, 34, 61, 1 /*35, 57, 93, 1*/),
        textSelectionColor: Colors.grey,
        accentColor: Colors.black38,
        bottomAppBarColor: Color.fromRGBO(22, 35, 57, 1 /**/),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/statistics': (context) => UserStatisticsPage(),
        '/community': (context) => CommunityPage(),
        '/profile': (context) => ProfilePage(),
        '/playlists': (context) => PlaylistsPage(),
      },
    );
  }
}
//accentColor: Color(0xFF1DE9B6)