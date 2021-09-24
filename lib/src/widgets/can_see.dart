import 'package:flutter/material.dart';
import '../permisison_base.dart';
import 'can_consume.dart';

/// Show [child] when [permissions] are granted.
class CanSee extends StatelessWidget {
  const CanSee({
    required this.permissions,
    required this.child,
    this.maintainSize = false,
    Key? key,
  }) : super(key: key);
  final List<PermissionBase> permissions;
  final Widget child;
  final bool maintainSize;

  @override
  Widget build(BuildContext context) {
    return CanConsume(
        permissions: permissions,
        builder: (context, allowed) {
          return Visibility(
            visible: allowed,
            child: child,
            maintainSize: maintainSize,
          );
        });
  }
}
