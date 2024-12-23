import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_forgot_signup_state.dart';

class LoginForgotSignupCubit extends Cubit<LoginForgotSignupState> {
  LoginForgotSignupCubit() : super(LoginForgotSignupInitial());
}
