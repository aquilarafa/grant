import 'package:flutter/material.dart';
import 'package:grant/grant.dart';
import 'package:provider/provider.dart';

import '../stores/internal_cubit.dart';
import '../stores/internal_store.dart';

class GrantAccess extends StatefulWidget {
  const GrantAccess({
    required this.child,
    this.initialPermissions = const [],
    Key? key,
  }) : super(key: key);
  final Widget child;
  final List<PermissionBase> initialPermissions;

  static InternalStore storeOf(BuildContext context) {
    return Provider.of<InternalStore>(context, listen: false);
  }

  @override
  _GrantAccessState createState() => _GrantAccessState();
}

class _GrantAccessState extends State<GrantAccess> {
  @override
  Widget build(BuildContext context) {
    return Provider<InternalStore>(
      create: (context) => InternalCubit(),
      child: widget.child,
    );
  }
}
