import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grant/grant.dart';
import 'package:grant/src/stores/internal_store.dart';
import 'package:provider/provider.dart';

class MockCanCreate extends GrantRuleBase {}

class MockCanSee extends GrantRuleBase {}

class MockCanUse extends GrantRuleBase {}

void main() {
  group('GrantAccess', () {
    testWidgets('provides internal store', (tester) async {
      InternalStore? store;
      await tester.pumpWidget(
        MaterialApp(
          home: GrantAccess(
            ruleGenerator: const Stream.empty(),
            child: Builder(builder: (context) {
              store = Provider.of<InternalStore>(context);

              return const SizedBox();
            }),
          ),
        ),
      );
      expect(store != null, true);
    });

    testWidgets('emits generated rules', (tester) async {
      final permissions = [MockCanCreate(), MockCanSee()];
      await tester.pumpWidget(
        GrantAccess(
          ruleGenerator: Stream.fromIterable([() => permissions]),
          child: Consumer<InternalStore>(builder: (context, store, _) {
            return StreamBuilder<List<GrantRuleBase>>(
                stream: store.stream,
                builder: (context, snapshot) {
                  return Column(
                    key: const Key('column'),
                    children: snapshot.data
                            ?.map((rule) => const SizedBox())
                            .toList() ??
                        [],
                  );
                });
          }),
        ),
      );
      await tester.pump(Duration.zero);
      final column = tester.widget<Column>(find.byKey(const Key('column')));
      expect(column.children.length, permissions.length);
    });
  });
}
