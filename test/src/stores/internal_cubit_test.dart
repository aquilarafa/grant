import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grant/grant.dart';
import 'package:grant/src/stores/internal_cubit.dart';

class MockCanSee extends PermissionBase {}

class MockCanLove extends PermissionBase {}

void main() {
  group('InternalCubit', () {
    blocTest(
      'emits [] when zero permissions are generated',
      build: () => InternalCubit(),
      expect: () => [],
    );
    blocTest<InternalCubit, List<PermissionBase>>(
      'emits [[MockPermission()]] when given permissions are generated',
      build: () => InternalCubit(),
      act: (cubit) => cubit.updatePermissions([MockCanSee()]),
      expect: () => [
        [MockCanSee()]
      ],
    );
    blocTest<InternalCubit, List<PermissionBase>>(
      'emits last generated permission list',
      build: () => InternalCubit(),
      act: (cubit) {
        cubit.updatePermissions([MockCanSee()]);
        cubit.updatePermissions([MockCanSee(), MockCanLove()]);
      },
      expect: () => [
        [MockCanSee()],
        [MockCanSee(), MockCanLove()]
      ],
    );
  });
}
