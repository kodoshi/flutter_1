import 'package:flutter_1/utils/translations/english.dart';
import 'package:flutter_1/utils/translations/french.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_1/widget/music/music_tile.dart';
import 'package:flutter_1/widget/music/minimal_music_tile.dart';
import 'package:eventify/eventify.dart';

/// Package used to make events bubble up to the top of the tree, and trigger certain state rebuilds 
final EventEmitter emitter = new EventEmitter(); //one instance to connect all events

int translation = Settings.getValue<int>('key-language', 1); //persisting key to remember language preference
List<MusicTile> globalTiles = []; //this array will hold the tiles displayed in HomePage

/// getter function to retrieve the translated phrase
String? getText(String element) {
  if (translation == 1) {
    return EnglishTranslation().translationArray[element];
  } else if (translation == 2) {
    return FrenchTranslation().translationArray[element];
  } else {
    return EnglishTranslation().translationArray[element];
  }
}

/// default Map object that sets the visual model used in SpecificPlaylistScreen
Map<String, String> specificPlaylistInfo = {
  'id': '0',
  'mainName': 'Lo-Fi',
  'description': 'Lorem Ipsum',
  'category': 'Instrumentals',
  'songs': 'lofi',
};

/// array that holds the true MusicTiles, will be referenced by placeholderTiles which in itself lacks an audio player
List<MusicTile> specificTiles = [
  MusicTile(
    globalTileID: 0,
    trackName: 'assets/sounds/lofi.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 1,
    trackName: 'assets/sounds/lofi.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 2,
    trackName: 'assets/sounds/lofi.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 3,
    trackName: 'assets/sounds/lofi.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 4,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
    metaArtist: 'Various Artists',
    metaAlbum: 'Nature',
  ),
  MusicTile(
    globalTileID: 5,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
    metaArtist: 'Various Artists',
    metaAlbum: 'Nature',
  ),
  MusicTile(
    globalTileID: 6,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
    metaArtist: 'Various Artists',
    metaAlbum: 'Nature',
  ),
  MusicTile(
    globalTileID: 7,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
    metaArtist: 'Various Artists',
    metaAlbum: 'Nature',
  ),
];

/// array that holds the fake MusicTiles, used to reference placeholderTiles, this is done to minimize unnecessary initialization
List<MinimalMusicTile> placeholderTiles = [
  MinimalMusicTile(
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Trappin',
  ),
  MinimalMusicTile(
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Trappin',
  ),
  MinimalMusicTile(
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Trappin',
  ),
  MinimalMusicTile(
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Trappin',
  ),
  MinimalMusicTile(
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
  ),
  MinimalMusicTile(
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
  ),
  MinimalMusicTile(
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
  ),
  MinimalMusicTile(
    imageName: 'assets/images/tropical-forest.png',
    metaTitle: 'Tropical',
  ),
];
