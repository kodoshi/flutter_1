import 'package:flutter/material.dart';
import 'package:flutter_1/page/home_page.dart';
import 'package:flutter_1/page/profile_page.dart';
import 'package:flutter_1/page/playlists_page.dart';
import 'package:flutter_1/page/community_page.dart';
import 'package:flutter_1/page/user_statistics.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/page/specific_playlist_page.dart';

class Footer extends StatelessWidget {
  final String? page;

  final indexArray = ["home", "playlists", "community", "statistics", "profile", "specific"];
  final redirectArray = [HomePage(), PlaylistsPage(), CommunityPage(), UserStatisticsPage(), ProfilePage(), SpecificPlaylistPage(),];
  Footer({this.page});

  @override
  Widget build(BuildContext context) {
    void handleRedirectFooter(int index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => redirectArray[index]),
      );
    }

    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.black,
      items: [
        new BottomNavigationBarItem(
            icon: Icon(Icons.home), label: getText('home').toString()),
        new BottomNavigationBarItem(
          icon: Icon(Icons.library_music_outlined),
          label: getText('playlists').toString(),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          label: getText('community').toString(),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart_outlined_outlined),
          label: getText('stats').toString(),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: getText('profile').toString(),
        )
      ],
      currentIndex: indexArray.indexOf(this.page.toString()),
      onTap: handleRedirectFooter,
    );
  }
}
