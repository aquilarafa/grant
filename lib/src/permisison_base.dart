import 'package:equatable/equatable.dart';

typedef PermissionsGeneratorFunction = List<PermissionBase> Function();

/// Base class for creating permission types
abstract class PermissionBase extends Equatable {
  @override
  List<Object?> get props => [];
}
