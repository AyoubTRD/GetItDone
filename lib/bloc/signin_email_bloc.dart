import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_email_event.dart';
part 'signin_email_state.dart';

class SigninEmailBloc extends Bloc<SigninEmailEvent, SigninEmailState> {
  SigninEmailBloc() : super(const SigninEmailInitial()) {
    on<SigninEmailEvent>((event, emit) {
      if (event is SetSigninEmail) {
        emit(SigninEmailFilled(event.email));
      }
    });
  }
}
