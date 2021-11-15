import 'package:flutter_1/api/tile/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('mange album ', () {
    final tilesService = TileServices();
    test('add an album to the home Page', () async {
      final int reponse =
          await tilesService.addTile('618bc399e1a5b35265ec41b1');
      expect(reponse, 200);
    });
    test('delete album on the Home Page', () async {
      final int reponse =
          await tilesService.removeTile('618bc399e1a5b35265ec41b1');
      expect(reponse, 200);
    });
  });
}
