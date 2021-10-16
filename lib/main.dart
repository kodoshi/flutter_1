import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/page/user_statistics.dart';
import 'package:flutter_1/page/home_page.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

void main() => {
      runApp(
        EasyDynamicThemeWidget(
          child: MyApp(),
        ),
      )
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VaporWare',
      themeMode: EasyDynamicTheme.of(context).themeMode,
      theme: ThemeData(
        backgroundColor: Color(0xFF332940),
        primaryColor: Color(0xFF1F1B24),
        accentColor: Color(0xFF1DE9B6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        backgroundColor: Color(0xFF332940),
        primaryColor: Color(0xFF1F1B24),
        accentColor: Color(0xFF1DE9B6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/statistics': (context) => UserStatisticsPage(),
        // '/community': (context) => MyCommunityPage(),
        // '/profile': (context) => MyProfilePage(),
        // '/playlists': (context) => MyPlaylistsPage(),
      },
    );
  }
}
