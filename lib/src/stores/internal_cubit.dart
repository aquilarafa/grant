import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../permisison_base.dart';
import 'internal_store.dart';

class InternalCubit extends Cubit<List<PermissionBase>>
    implements InternalStore {
  InternalCubit({
    required Stream<PermissionsGeneratorFunction> permissionsGenerator,
  }) : super(const []) {
    _streamSubscription = permissionsGenerator.listen((generator) {
      emit(generator());
    });
  }
  StreamSubscription<PermissionsGeneratorFunction>? _streamSubscription;

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<List<PermissionBase>> get stream => super.stream;
}
