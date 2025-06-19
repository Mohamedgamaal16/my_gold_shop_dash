import 'package:my_gold_dashboard/Features/auth/login/data/data_source/login_data_source.dart';
import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';
import 'package:my_gold_dashboard/Features/auth/login/domain/repo/login_repo.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../model/login_parameters.dart';

class LoginRepoImpl implements LoginRepo{
  LoginDataSource loginDataSource;
  LoginRepoImpl({required this.loginDataSource});
  @override
  Future<ApiResult<LoginResponse>> login(LoginParameters parameters)async {
    var response = await loginDataSource.login(parameters);
    return response;
  }
}