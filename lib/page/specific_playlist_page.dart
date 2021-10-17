import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/footer.dart';

class SpecificPlaylistPage extends StatefulWidget {
  //final String mainName;
  //final String description;
  //final String category;
  //final String songs;

  SpecificPlaylistPage({
    Key? key,
    //required this.mainName,
    //required this.category,
    //required this.description,
    //required this.songs,
  }) : super(key: key);

  @override
  _SpecificPlaylistPageState createState() => _SpecificPlaylistPageState();
}

class _SpecificPlaylistPageState extends State<SpecificPlaylistPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Playlist'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 60,
              padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    specificPlaylistInfo['mainName']!,
                    style: TextStyle(fontSize: 28, color: Colors.white),
                    textAlign: TextAlign.center,
                  ))),
          Container(
              height: 20,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(specificPlaylistInfo['category']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14)))),
          Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Divider(color: Colors.blueGrey)),
          Container(
              margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: ElevatedButton(
                  onPressed: () {
                    print("we here");
                    print(int.parse(specificPlaylistInfo['id']!));
                    globalTiles.add(
                        specificTiles[int.parse(specificPlaylistInfo['id']!)]); //global magic
                  },
                  child: Text(getText('addHome').toString()),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          (Colors.blueGrey[900])!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))))),
          Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Divider(color: Colors.blueGrey)),
          Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(getText('aboutPack').toString(),
                            style: TextStyle(color: Colors.white)))),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(specificPlaylistInfo['description']!,
                            style:
                                TextStyle(color: Colors.white, height: 1.5)))),
                Container(
                  height: 200.0,
                  width: width,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(47, 59, 90, 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
                                  child: Text("Music",
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
                                  child: Text(
                                      "01     " +
                                          specificPlaylistInfo['songs']!,
                                      style: TextStyle(color: Colors.white)))
                            ],
                          ))),
                ),
              ]))
        ],
      ),
      bottomNavigationBar: new Footer(page: "playlists"),
    );
  }
}