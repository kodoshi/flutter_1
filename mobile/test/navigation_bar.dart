import 'package:flutter/material.dart';
import 'package:flutter_1/page/community_page.dart';
import 'package:flutter_1/page/home_page.dart';
import 'package:flutter_1/page/playlists_page.dart';
import 'package:flutter_1/page/profile_page.dart';
import 'package:flutter_1/page/user_statistics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AppNavigatorFactory {
  AppNavigator get(BuildContext context) =>
      AppNavigator._forNavigator(Navigator.of(context));
}

class TestAppNavigatorFactory extends AppNavigatorFactory {
  final AppNavigator mockAppNavigator;

  TestAppNavigatorFactory(this.mockAppNavigator);

  @override
  AppNavigator get(BuildContext context) => mockAppNavigator;
}

class AppNavigator {
  NavigatorState _flutterNavigator;
  AppNavigator._forNavigator(this._flutterNavigator);

  void showHomePage() {
    _flutterNavigator.pushNamed('/home');
  }

  void showStatisticalPage() {
    _flutterNavigator.pushNamed('/statistics');
  }

  void showCommunityPage() {
    _flutterNavigator.pushNamed('/community');
  }

  void showProfilPage() {
    _flutterNavigator.pushNamed('/profile');
  }

  void showPlaylistPage() {
    _flutterNavigator.pushNamed('/playlists');
  }
}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  group('Navigation bar test', () {
    final appNavigator = MockAppNavigator();

    setUp(() {
      reset(appNavigator);
    });

    testWidgets('Button is present and triggers navigation to Home ',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      expect(find.byType(Icon), findsOneWidget);
      await tester.tap(find.byType(Icon));

      verify(appNavigator.showHomePage());
    });

    testWidgets('Button is present and triggers navigation to Statistical ',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: UserStatisticsPage()));

      expect(find.byType(Icon), findsOneWidget);
      await tester.tap(find.byType(Icon));

      verify(appNavigator.showHomePage());
    });
    testWidgets('Button is present and triggers navigation to Community ',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CommunityPage()));

      expect(find.byType(Icon), findsOneWidget);
      await tester.tap(find.byType(Icon));

      verify(appNavigator.showHomePage());
    });
    testWidgets('Button is present and triggers navigation to Profil ',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProfilePage()));

      expect(find.byType(Icon), findsOneWidget);
      await tester.tap(find.byType(Icon));

      verify(appNavigator.showHomePage());
    });
    testWidgets('Button is present and triggers navigation to Playlist ',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PlaylistsPage()));

      expect(find.byType(Icon), findsOneWidget);
      await tester.tap(find.byType(Icon));

      verify(appNavigator.showHomePage());
    });
  });
}
