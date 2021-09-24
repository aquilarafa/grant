import 'package:equatable/equatable.dart';

typedef RuleGeneratorFunction = List<GrantRuleBase> Function();

/// Base class for creating rule types
abstract class GrantRuleBase extends Equatable {
  @override
  List<Object?> get props => [];
}
