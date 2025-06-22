import 'package:my_gold_dashboard/Features/auth/otp/data/data_source/otp_data_source.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/OtpResponse.dart';

import 'package:my_gold_dashboard/Features/auth/otp/data/model/otp_parameters.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../domain/repo/otp_repo.dart';

class OtpRepoImpl implements OtpRepo {
  OtpDataSource otpDataSource;
  OtpRepoImpl({required this.otpDataSource});
  @override
  Future<ApiResult<OtpResponse>> otp(OtpParameters parameters)async {
    var response = await otpDataSource.otp(parameters);
    return response;
  }
}