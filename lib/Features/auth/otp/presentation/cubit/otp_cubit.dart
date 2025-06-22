import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:my_gold_dashboard/Features/auth/otp/data/data_source/otp_data_source_impl.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/OtpResponse.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/repo_impl/otp_repo_impl.dart';
import 'package:my_gold_dashboard/Features/auth/otp/domain/usecases/otp_use_cases.dart';
import 'package:my_gold_dashboard/Features/auth/otp/presentation/cubit/otp_state.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../data/model/otp_parameters.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitState());

  final OtpUseCases _otpUseCases = OtpUseCases(
    otpRepo: OtpRepoImpl(
      otpDataSource: OtpDataSourceImpl(apiManager: ApiManager()),
    ),
  );

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> verifyOtp(OtpParameters params) async {
    emit(OtpLoadingState());

    final response = await _otpUseCases.call(params);

    switch (response) {
      case ApiSuccessResult<OtpResponse>():
        final data = response.data;

        if (data.message != 'OTP verified successfully') {
          emit(OtpErrorState(message: data.message ?? 'OTP error'));
          return;
        }

        if (data.accessToken != null) {
          await _secureStorage.write(
              key: 'access_token', value: data.accessToken);
        }

        emit(OtpSuccessState(otpResponse: data));
        log(' OTP verified. Token saved.');

      case ApiErrorResult<OtpResponse>():
        emit(OtpErrorState(message: response.failures.message));
    }
  }
}
