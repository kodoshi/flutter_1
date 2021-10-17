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
        backgroundColor: Color(0xFF121212),
        primaryColor: Color(0xFF1F1F1F),
        cardColor: Color(0xFF2D2D2D),
        accentColor: Color(0xFF1DE9B6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        backgroundColor: Color(0xFF332940),
        primaryColor: Color(0xFF1F1B24),
        cardColor: Color(0xFF7F7F7F),
        accentColor: Color(0xFF1DE9B6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/statistics': (context) => UserStatisticsPage(),
        '/community': (context) => CommunityPage(),
        '/profile': (context) => ProfilePage(),
        '/playlists': (context) => PlaylistsPage(),
      },
    );
  }
}
