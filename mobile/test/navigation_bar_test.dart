import 'package:flutter/material.dart';
import 'package:flutter_1/page/home_page.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/main.dart' as MyApp;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

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
//class MockFooter extends Mock implements Footer {}
void main() {
  group('Navigation bar test', () {
    final appNavigator = MockAppNavigator();

    setUp(() {
      reset(appNavigator);
    });

    testWidgets('Button is present and triggers navigation to Home.',
        (WidgetTester tester) async {
      //Future my_app = await MyApp.main();
      final my_footer = new Footer(page: "home");
      //await Settings.init(cacheProvider: SharePreferenceCache());
      tester.pumpWidget(my_footer);
      expect(my_footer.page, "home");
    }, timeout: Timeout(Duration(seconds: 15)));
    testWidgets('Button is present and triggers navigation to Playlist screen.',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      expect(find.byIcon(Icons.library_music_outlined), findsOneWidget);
      await tester.tap(find.byIcon(Icons.library_music_outlined));
      verify(appNavigator.showHomePage());
    });
    testWidgets(
        'Button is present and triggers navigation to Community screen.',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      expect(
          find.byIcon(Icons.supervised_user_circle_outlined), findsOneWidget);
      await tester.tap(find.byIcon(Icons.supervised_user_circle_outlined));
      verify(appNavigator.showHomePage());
    });
    testWidgets('Button is present and triggers navigation to Stats screen.',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      expect(find.byIcon(Icons.insert_chart_outlined_outlined), findsOneWidget);
      await tester.tap(find.byIcon(Icons.insert_chart_outlined_outlined));
      verify(appNavigator.showHomePage());
    });
    testWidgets('Button is present and triggers navigation to Profile screen.',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      expect(find.byIcon(Icons.account_circle_outlined), findsOneWidget);
      await tester.tap(find.byIcon(Icons.account_circle_outlined));
      verify(appNavigator.showHomePage());
    });
  });
}
