import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';

abstract class LoginState{}

class LoginInitState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  LoginResponse loginResponse;
  LoginSuccessState({required this.loginResponse});
}
class LoginErrorState extends LoginState{
  String message;
  LoginErrorState({required this.message});
}