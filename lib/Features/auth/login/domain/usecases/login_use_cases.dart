import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';
import 'package:my_gold_dashboard/Features/auth/login/domain/repo/login_repo.dart';

import '../../../../../core/api/api_result.dart';
import '../../data/model/login_parameters.dart';

class LoginUseCases{
  LoginRepo loginRepo;
  LoginUseCases({required this.loginRepo});
  Future<ApiResult<LoginResponse>> call(LoginParameters parameters) => loginRepo.login(parameters);
}