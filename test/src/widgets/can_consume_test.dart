import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grant/grant.dart';
import 'package:grant/src/widgets/can_consume.dart';

class MockCanSee extends PermissionBase {}
class MockCanUse extends PermissionBase {}

void main() {
  group('Can Consume', () {
    testWidgets('should allow permissions', (tester) async {
      await tester.pumpWidget(
        GrantAccess(
          ruleGenerator: Stream.fromIterable([
            () => [MockCanSee()]
          ]),
          child: CanConsume(
            permissions: [MockCanSee()],
            builder: (context, allowed) {
              return allowed
                  ? Container(key: const Key('allowed'))
                  : Container();
            },
          ),
        ),
      );
      await tester.pump(Duration.zero);
      expect(
        find.byKey(const Key('allowed'), skipOffstage: false),
        findsOneWidget,
      );
    });

    testWidgets('should not allow permissions', (tester) async {
      await tester.pumpWidget(
        GrantAccess(
          ruleGenerator: Stream.fromIterable([
            () => []
          ]),
          child: CanConsume(
            permissions: [MockCanSee()],
            builder: (context, allowed) {
              return allowed
                  ? Container(key: const Key('allowed'))
                  : Container();
            },
          ),
        ),
      );
      await tester.pump(Duration.zero);
      expect(
        find.byKey(const Key('allowed'), skipOffstage: false),
        findsNothing,
      );
    });
  });
}
