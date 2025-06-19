import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../model/login_parameters.dart';

abstract class LoginDataSource{
  Future<ApiResult<LoginResponse>> login(LoginParameters parameters);
}