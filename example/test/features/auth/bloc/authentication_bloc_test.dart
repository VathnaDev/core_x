import 'package:bloc_test/bloc_test.dart';
import 'package:example/features/auth/bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

import '../../../mock_storage.dart';

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  group('AuthenticationBloc', () {
    blocTest(
      'emit _Initial for default state',
      build: () => AuthenticationBloc(),
      expect: () => [],
    );

    blocTest(
      'emit [authenticated] when singIn() called',
      build: () => AuthenticationBloc(),
      act: (bloc) => [
        bloc.add(const AuthenticationEvent.singIn()),
      ],
      expect: () => [
        const AuthenticationState.authenticated(),
      ],
    );

    blocTest(
      'emit [unAuthenticated] when signOut called',
      build: () => AuthenticationBloc(),
      act: (bloc) => [
        bloc.add(const AuthenticationEvent.signOut()),
      ],
      expect: () => [
        const AuthenticationState.unAuthenticated(),
      ],
    );
  });
}
