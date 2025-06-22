import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/otp_parameters.dart';
import 'package:my_gold_dashboard/Features/auth/otp/presentation/cubit/otp_cubit.dart';
import 'package:my_gold_dashboard/Features/auth/otp/presentation/cubit/otp_state.dart';
import 'package:my_gold_dashboard/Features/auth/otp/presentation/screen/widgets/otp_field.dart';
import 'package:my_gold_dashboard/Features/auth/otp/presentation/screen/widgets/timer_button.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({super.key, required this.phone});
  final String phone;

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpSuccessState) {
          context.go(Routes.homeScreen);
        } else if (state is OtpErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final loading = state is OtpLoadingState;
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "OTP",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heading6(context)
                          .copyWith(color: AppColors.colorsPrimary2),
                    ),
                    const SizedBox(height: 16),
                    OtpField(controller: _controller),
                    const SizedBox(height: 16),
                    TimerButton(phone: widget.phone),
                    const Spacer(),
                    CustomButton(
                      labelName: loading ? "Verifying..." : "Verify",
                      isPrimary: true,
                      onPressed: loading
                          ? null
                          : () {
                        final code = _controller.text.trim();
                        if (code.length == 6 &&
                            int.tryParse(code) != null) {
                          context.read<OtpCubit>().verifyOtp(
                            OtpParameters(
                                phone: widget.phone, otp: code),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                  Text("Enter a valid 6-digit code")));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
