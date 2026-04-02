import 'package:flutter_test/flutter_test.dart';
import 'package:ballade_art/main.dart';

void main() {
  testWidgets('App builds smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(disableSplashDelays: true));

    // İlk frame
    await tester.pump();

    // App ayağa kalktı mı (crash yok mu)?
    expect(find.byType(MyApp), findsOneWidget);
  });
}
