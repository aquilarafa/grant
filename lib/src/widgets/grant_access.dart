import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/internal_store.dart';
import '../grant_rule_base.dart';

class GrantAccess extends StatefulWidget {
  const GrantAccess({
    required this.child,
    required this.ruleGenerator,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final Stream<RuleGeneratorFunction> ruleGenerator;

  @override
  _GrantAccessState createState() => _GrantAccessState();
}

class _GrantAccessState extends State<GrantAccess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<InternalStore>(
      create: (context) => InternalCubit(
        ruleGenerator: widget.ruleGenerator,
      ),
      child: widget.child,
    );
  }
}
