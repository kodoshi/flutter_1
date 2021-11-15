import 'package:flutter/material.dart';
import 'package:flutter_1/page/community_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'navigation_bar.dart';

void main() {
  final appNavigator = MockAppNavigator();

  testWidgets('navigate to home page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CommunityPage()));
    await tester.tap(find.byKey(Key('home')));
    verify(appNavigator.showHomePage());
  });
}
