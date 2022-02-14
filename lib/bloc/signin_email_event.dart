part of 'signin_email_bloc.dart';

@immutable
abstract class SigninEmailEvent {
  const SigninEmailEvent();
}

class SetSigninEmail extends SigninEmailEvent {
  final String email;
  const SetSigninEmail(this.email);
}
