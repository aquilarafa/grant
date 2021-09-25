import 'dart:async';

import '../permisison_base.dart';

abstract class InternalStore {
  Stream<List<PermissionBase>> get stream;
}
