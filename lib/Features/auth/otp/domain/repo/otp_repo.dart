import 'package:my_gold_dashboard/Features/auth/otp/data/model/OtpResponse.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/otp_parameters.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

abstract class OtpRepo{
  Future<ApiResult<OtpResponse>> otp(OtpParameters parameters);
}