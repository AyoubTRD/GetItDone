part of 'signin_email_bloc.dart';

@immutable
abstract class SigninEmailState {
  const SigninEmailState();
}

class SigninEmailInitial extends SigninEmailState {
  final String email = '';
  const SigninEmailInitial();

  @override
  bool operator ==(Object other) {
    return other is SigninEmailInitial;
  }

  @override
  int get hashCode => email.hashCode;
}

class SigninEmailFilled extends SigninEmailState {
  final String email;
  const SigninEmailFilled(this.email);

  @override
  bool operator ==(Object other) {
    if (other is SigninEmailFilled) {
      return other.email == email;
    }
    return false;
  }
}
