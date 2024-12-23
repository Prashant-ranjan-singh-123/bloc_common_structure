import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared_pref/shared_preference.dart';
import 'login_check_state.dart';

class LoginCheckCubit extends Cubit<LoginCheckState>{
  LoginCheckCubit(): super(LoginCheckState());

  Future<void> checkToken() async {
    try {
      // await SharedPreferenceLogic.setLoginFalse();
      bool isLogin = await SharedPreferenceLogic.isLogIn();
      if(isLogin){
        emit(state.copyWith(loading: false,  isTokenPresent: true));
      }else{
        emit(state.copyWith(loading: false, isTokenPresent: false));
      }
    } catch (e){
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}