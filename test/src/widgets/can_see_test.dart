import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grant/grant.dart';
import 'package:grant/src/stores/internal_store.dart';
import 'package:grant/src/widgets/can_see.dart';

class MockCanSee extends PermissionBase {}

void main() {
  group('CanSee widget', () {
    testWidgets('should show widget when permission are granted',
        (tester) async {
      InternalStore? store;
      await tester.pumpWidget(
        GrantAccess(child: Builder(builder: (context) {
          store = GrantAccess.storeOf(context);
          return CanSee(
            permissions: [MockCanSee()],
            child: Container(key: const Key('child')),
          );
        })),
      );
      store?.updatePermissions([MockCanSee()]);
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
