import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../permisison_base.dart';
import 'internal_store.dart';

class InternalCubit extends Cubit<List<PermissionBase>>
    implements InternalStore {
  InternalCubit() : super(const []);

  @override
  Stream<List<PermissionBase>> get stream => super.stream;

  @override
  void updatePermissions(List<PermissionBase> permissions) {
    emit(permissions);
  }
}
