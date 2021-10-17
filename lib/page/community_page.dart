import 'package:flutter/material.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/widget/music/music_tile.dart';
import 'package:flutter_1/widget/music/minimal_music_tile.dart';
import 'package:flutter_1/utils/globalVars.dart';

/// this page contains the most liked and played playlists from the user community
/// at the moment has mostly placeholders since this info is needed from the backend
class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text(getText('community').toString()),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(width / 16, height / 16, 0, 0),
                width: width,
                height: 100,
                child: Text(getText('communityFavorites').toString(),
                    style: TextStyle(fontSize: 30))),
            Container(
                child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  height: height / 25,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Pop Music'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Theme.of(context).cardColor)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Rock'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Theme.of(context).cardColor)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Hip Hop'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Theme.of(context).cardColor)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Summer'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Theme.of(context).cardColor)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))))),
                    ],
                  )),
            )),
            Container(
                child: SizedBox(
                    height: 200,
                    child: GridView.count(
                      //primary: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(25),
                      crossAxisSpacing: 12.5,
                      mainAxisSpacing: 12.5,
                      crossAxisCount: 1,
                      children: <Widget>[
                        MinimalMusicTile(
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                        ),
                        MinimalMusicTile(
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                        ),
                        MinimalMusicTile(
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                        ),
                        MinimalMusicTile(
                          imageName: 'assets/images/street-japan-night.jpg',
                          metaTitle: 'Lo-Fi',
                        ),
                      ],
                    ))),
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: new Footer(page: "community"));
  }
}
