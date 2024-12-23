part of 'login_forgot_signup_cubit.dart';

sealed class LoginForgotSignupState extends Equatable {
  const LoginForgotSignupState();
}

final class LoginForgotSignupInitial extends LoginForgotSignupState {
  @override
  List<Object> get props => [];
}
