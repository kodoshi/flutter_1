import 'package:flutter/material.dart';

class MyProfilPage extends StatefulWidget {
  @override
  _MyProfilPageState createState() => _MyProfilPageState();
}

class _MyProfilPageState extends State<MyProfilPage> {
  late var photoTaken = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 25, 39, 1),
      appBar: AppBar(
        title: Center(
          child: Text('Vaporware'),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                //change route
                print('container pressed');
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Color.fromRGBO(33, 40, 63, 1)),
                child: Align(
                    child: Text(
                  'Statistical',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          Row(
            children: [
              Align(
                child: Text(
                  'Sleep',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 40, 63, 1),
                    borderRadius: BorderRadius.circular(17)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (photoTaken == null)
                      Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Color.fromRGBO(142, 142, 147, 1),
                      )
                    else
                      Text('MESSAGE'),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Text(
                        'Profil picutre',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: 350,
            decoration: BoxDecoration(
                color: Color.fromRGBO(33, 40, 63, 1),
                borderRadius: BorderRadius.circular(17)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Personnal Information',
                    style: TextStyle(color: Colors.white, fontSize: 23)),
                Row(
                  children: [
                    Text('First name: Marine',
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                  ],
                ),
                Row(
                  children: [
                    Text('Familly name: Lepen',
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                  ],
                ),
                Row(
                  children: [
                    Text('Username: Lamarinade',
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                  ],
                ),
                Row(
                  children: [
                    Text('Email: marine.lepen@lfn.com',
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              //add function take Picture
              print('jai pris la photo');
            },
            child: Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 40, 63, 1),
                  borderRadius: BorderRadius.circular(17)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.photo_camera,
                    color: Color.fromRGBO(142, 142, 147, 1),
                    size: 60,
                  ),
                  Text('Take a picture',
                      style: TextStyle(color: Colors.white, fontSize: 23)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /*Future _takePicture() async {
    photoTaken = await ImagePicker.pickImage(source: ImageSource.camera);
  }
  */
}
