import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const _Initial()) {
    on<AuthenticationEvent>((event, emit) {
      event.when(
        singIn: () {
          log("SignIn Succesfully...!");
          emit(const AuthenticationState.authenticated());
        },
        signOut: () {
          log("SignOut Succesfully...!");
          emit(const AuthenticationState.unAuthenticated());
        },
      );
    });
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    final authenticated = json['authenticated'] as bool;
    if (authenticated) {
      return AuthenticationState.authenticated();
    } else {
      return AuthenticationState.unAuthenticated();
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    return {
      'authenticated': state.when(
        initial: () => false,
        authenticated: () => true,
        unAuthenticated: () => false,
      )
    };
  }
}
