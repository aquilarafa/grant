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
      build: () => InternalCubit(permissionsGenerator: const Stream.empty()),
      expect: () => [],
    );
    blocTest(
      'emits [[MockPermission()]] when given permissions are generated',
      build: () => InternalCubit(
          permissionsGenerator: Stream.fromIterable([
        () => [MockCanSee()]
      ])),
      expect: () => [
        [MockCanSee()]
      ],
    );
    blocTest(
      'emits last generated permission list',
      build: () => InternalCubit(
          permissionsGenerator: Stream.fromIterable([
        () => [MockCanSee()],
        () => [MockCanSee(), MockCanLove()],
      ])),
      expect: () => [
        [MockCanSee()],
        [MockCanSee(), MockCanLove()]
      ],
    );
  });
}
