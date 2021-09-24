import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grant/grant.dart';
import 'package:grant/src/widgets/can_see.dart';

class MockCanSee extends GrantRuleBase {}

void main() {
  group('CanSee widget', () {
    testWidgets('should show widget when permission are granted',
        (tester) async {
      await tester.pumpWidget(
        GrantAccess(
          ruleGenerator: Stream.fromIterable([
            () => [MockCanSee()]
          ]),
          child: CanSee(
            permissions: [MockCanSee()],
            child: Container(key: const Key('child')),
          ),
        ),
      );
      await tester.pump(Duration.zero);
      expect(
        find.byKey(const Key('child'), skipOffstage: false),
        findsOneWidget,
      );
    });

    testWidgets('should hide widget when permission are not granted',
        (tester) async {
      await tester.pumpWidget(
        GrantAccess(
          ruleGenerator: Stream.fromIterable([() => []]),
          child: CanSee(
            permissions: [MockCanSee()],
            child: Container(key: const Key('child')),
          ),
        ),
      );
      await tester.pump(Duration.zero);
      expect(
        find.byKey(const Key('child'), skipOffstage: false),
        findsNothing,
      );
    });
  });
}
