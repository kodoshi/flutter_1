import 'package:flutter/material.dart';
import 'package:flutter_1/page/home_page.dart';
import 'package:flutter_1/page/profile_page.dart';
import 'package:flutter_1/page/playlists_page.dart';
import 'package:flutter_1/page/community_page.dart';
// import 'package:flutter_1/page/user_statistics.dart';

// class BottomNavigationBarWidget extends StatelessWidget {
//   const BottomNavigationBarWidget();

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(items: <BottomNavigationBarItem>[
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//       BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined), label: 'Playlists'),
//       BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_outlined), label: 'Community'),
//       BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
//     ]);
//   }
// }

class Footer extends StatelessWidget {
  final String? page;

  final indexArray = ["Home", "Playlists", "Community", "Profile"];
  final redirectArray = [HomePage(), PlaylistsPage(), CommunityPage(), MyProfilePage()];
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
            icon: Icon(Icons.home), label: 'Home'),
        new BottomNavigationBarItem(
          icon: Icon(Icons.library_music_outlined),
          label: 'Playlists',
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          label: 'Community',
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
        )
      ],
      currentIndex: indexArray.indexOf(this.page.toString()),
      onTap: handleRedirectFooter,
    );
  }
}