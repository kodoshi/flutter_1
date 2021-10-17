import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/utils/globalVars.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }
  void addTileToList() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    emitter.on('updateTileList', this, (event, context) {
      addTileToList();
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('VaporWare'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: (globalTiles.length == 0)
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    getText('lonelyText').toString(),
                    style: TextStyle(fontSize: 20,),
                    textAlign: TextAlign.center,
                  ))
              : GridView.builder(
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 1,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25),
                  itemCount: globalTiles.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: globalTiles[index],
                    );
                  }),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: new Footer(page: "home"));
  }
}
