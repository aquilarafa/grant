import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/internal_cubit.dart';
import '../stores/internal_store.dart';
import '../permisison_base.dart';

class GrantAccess extends StatefulWidget {
  const GrantAccess({
    required this.child,
    required this.permissionsGenerator,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final Stream<PermissionsGeneratorFunction> permissionsGenerator;

  @override
  _GrantAccessState createState() => _GrantAccessState();
}

class _GrantAccessState extends State<GrantAccess> {
  @override
  Widget build(BuildContext context) {
    return Provider<InternalStore>(
      create: (context) => InternalCubit(
        permissionsGenerator: widget.permissionsGenerator,
      ),
      child: widget.child,
    );
  }
}
