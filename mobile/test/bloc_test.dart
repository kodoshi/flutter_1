// ignore_for_file: unused_local_variable, unused_import, non_constant_identifier_names

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_1/api/playlist/services.dart';
import 'package:flutter_1/api/profile/services.dart';
import 'package:flutter_1/api/stat/services.dart';
import 'package:flutter_1/api/tile/services.dart';

import 'package:flutter_1/model/playlist.dart';
import 'package:flutter_1/model/profile.dart';
import 'package:flutter_1/model/stats_chart_data.dart';

class MockPlaylistServices extends Mock implements PlaylistServices {}

class MockProfileServices extends Mock implements ProfileServices {}

class MockStatServices extends Mock implements StatServices {}

class MockTileServices extends Mock implements TileServices {}

void main() {
  group('Testing all API routes ', () {
    final playlist_services = MockPlaylistServices();
    final profile_services = MockProfileServices();
    final stat_services = MockStatServices();
    final tile_services = MockTileServices();

    test('Get All Playlists', () async {
      var response = await playlist_services.getPlaylists();
      expect(response.length, 9);
      //expect(true, true);
    });
    test('Get User personal info', () async {
      final sample_user = new Profile(
          name: 'Klivens',
          surname: 'Ziu',
          email: 'test@gmail.com',
          image:
              '/data/user/0/com.example.flutter_1/cache/image_picker7313699243630009504.jpg');

      final Profile response = await profile_services.getProfile();
      expect(response, sample_user);
      //expect(true, true);
    });

    test('Update User picture', () async {
      final String image_string =
          '/data/user/0/com.example.flutter_1/cache/image_picker7313699243630009504.jpg';

      final bool response = await profile_services.updateImage(image_string);
      expect(response, true);
      //expect(true, true);
    });

    test('Get All Single Day Stat', () async {
      final List<StatsChartData> response = await stat_services.getStats();
      expect(response.length, 7);
      //expect(true, true);
    });

    test('Post a Single Day Stat', () async {
      final bool response = await stat_services.addStat("Monday", "Nature", 60);
      expect(response, true);
      //expect(true, true);
    });

    test('Post an active tile', () async {
      final bool response =
          await tile_services.addTile('618bc399e1a5b35265ec41b1');
      expect(response, true);
      //expect(true, true);
    });
    test('Get All active tiles', () async {
      final List<Playlist> response = await tile_services.getTileList();
      expect(response.length, 1);
      //expect(true, true);
    });
    test('Delete an active tile', () async {
      final bool response =
          await tile_services.removeTile('618bc399e1a5b35265ec41b1');
      expect(response, true);
      //expect(true, true);
    });
  });
}
