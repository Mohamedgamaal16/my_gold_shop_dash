
import 'package:my_gold_dashboard/Features/auth/otp/data/model/OtpResponse.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/otp_parameters.dart';
import 'package:my_gold_dashboard/Features/auth/otp/domain/repo/otp_repo.dart';

import '../../../../../core/api/api_result.dart';

class OtpUseCases{
  OtpRepo otpRepo;
  OtpUseCases({required this.otpRepo});
  Future<ApiResult<OtpResponse>> call(OtpParameters parameters) => otpRepo.otp(parameters);
}