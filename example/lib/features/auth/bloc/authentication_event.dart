part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.singIn() = SignIn;
  const factory AuthenticationEvent.signOut() = _SignOut;
}