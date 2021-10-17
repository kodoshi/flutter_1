import 'package:flutter_1/utils/translations/english.dart';
import 'package:flutter_1/utils/translations/french.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_1/widget/music/music_tile.dart';
import 'package:flutter_1/widget/music/minimal_music_tile.dart';
import 'package:eventify/eventify.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter_1/main.dart';
import 'package:flutter/material.dart';

final EventEmitter emitter = new EventEmitter();

int translation = Settings.getValue<int>('key-language', 1);
List<MusicTile> globalTiles = [];

String? getText(String element) {
  if (translation == 1) {
    return EnglishTranslation().translationArray[element];
  } else if (translation == 2) {
    return FrenchTranslation().translationArray[element];
  } else {
    return EnglishTranslation().translationArray[element];
  }
}

Map<String, String> specificPlaylistInfo = {
  'id': '0',
  'mainName': 'Lo-Fi',
  'description': 'Lorem Ipsum',
  'category': 'Instrumentals',
  'songs': 'lofi',
};

List<MusicTile> specificTiles = [
  MusicTile(
    globalTileID: 0,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 1,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 2,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 3,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 4,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 5,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 6,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
  MusicTile(
    globalTileID: 7,
    trackName: 'assets/sounds/tropical.mp3',
    imageName: 'assets/images/street-japan-night.jpg',
    metaTitle: 'Lo-Fi',
    metaArtist: 'Various Artists',
    metaAlbum: 'Instrumentals',
  ),
];

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
];
