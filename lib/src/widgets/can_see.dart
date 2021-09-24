import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../grant_rule_base.dart';
import '../stores/internal_store.dart';

/// Show [child] when [permissions] are granted.
class CanSee extends StatelessWidget {
  const CanSee({
    required this.permissions,
    required this.child,
    this.maintainSize = false,
    Key? key,
  }) : super(key: key);
  final List<GrantRuleBase> permissions;
  final Widget child;
  final bool maintainSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<InternalStore>(builder: (context, store, _) {
      return StreamBuilder<List<GrantRuleBase>>(
          stream: store.stream,
          builder: (context, snapshot) {
            final matches = const ListEquality().equals;
            final storedPermissions = snapshot.data ?? [];
            final permissionGranted = matches(storedPermissions, permissions);
            return Visibility(
              visible: permissionGranted,
              child: child,
              maintainSize: maintainSize,
            );
          });
    });
  }
}
