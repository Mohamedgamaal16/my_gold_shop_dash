import 'package:my_gold_dashboard/Features/auth/otp/data/model/OtpResponse.dart';

abstract class OtpState{}


class OtpInitState extends OtpState{}
class OtpLoadingState extends OtpState{}
class OtpSuccessState extends OtpState{
  OtpResponse otpResponse;
  OtpSuccessState({required this.otpResponse});
}
class OtpErrorState extends OtpState{
  String message;
  OtpErrorState({required this.message});
}