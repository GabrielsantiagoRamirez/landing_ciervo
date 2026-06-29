import 'package:flutter_test/flutter_test.dart';

import 'package:ciervo_landing/app/ciervo_app.dart';

void main() {
  testWidgets('CIERVO app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const CiervoApp());
    expect(find.text('CIERVO'), findsWidgets);
  });
}
