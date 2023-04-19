import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
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
}
