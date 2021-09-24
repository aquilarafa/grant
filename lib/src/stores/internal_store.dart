import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../permisison_base.dart';

abstract class InternalStore {
  Stream<List<PermissionBase>> get stream;
}

class InternalCubit extends Cubit<List<PermissionBase>>
    implements InternalStore {
  InternalCubit({
    required Stream<PermissionsGeneratorFunction> ruleGenerator,
  }) : super(const []) {
    _streamSubscription = ruleGenerator.listen((generator) {
      emit(generator());
    });
  }
  StreamSubscription<List<PermissionBase> Function()>? _streamSubscription;

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<List<PermissionBase>> get stream => super.stream;
}
