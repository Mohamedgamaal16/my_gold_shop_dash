import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../data/model/login_parameters.dart';

abstract class LoginRepo{
  Future<ApiResult<LoginResponse>> login(LoginParameters parameters);
}