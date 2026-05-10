import 'package:flutter_test/flutter_test.dart';
import 'package:justicia_digital/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const JusticiaDigitalApp());
    expect(find.text('Legal Tech ZSEJC'), findsWidgets);
  });
}
