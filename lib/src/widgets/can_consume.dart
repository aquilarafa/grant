import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../permisison_base.dart';
import '../stores/internal_store.dart';

class CanConsume extends StatelessWidget {
  const CanConsume({
    required this.permissions,
    required this.builder,
    Key? key,
  }) : super(key: key);
  final List<PermissionBase> permissions;
  final Widget Function(BuildContext context, bool allowed) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<InternalStore>(builder: (context, store, _) {
      return StreamBuilder<List<PermissionBase>>(
          stream: store.stream,
          builder: (context, snapshot) {
            final matches = const ListEquality().equals;
            final storedPermissions = snapshot.data ?? [];
            final permissionGranted = matches(storedPermissions, permissions);
            return builder(context, permissionGranted);
          });
    });
  }
}
