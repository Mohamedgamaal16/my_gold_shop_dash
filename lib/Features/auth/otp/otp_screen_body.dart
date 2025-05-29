import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/auth/otp/widgets/otp_field.dart';
import 'package:my_gold_dashboard/Features/auth/otp/widgets/timer_button.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "OTP",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading6(
                    context,
                  ).copyWith(color: AppColors.colorsPrimary2),
                ),
                const SizedBox(height: 16),

                OtpField(controller: controller),
                const SizedBox(height: 16),
                TimerButton(phone: phone),
                Spacer(),
                CustomButton(
                  labelName: "verify",
                  isPrimary: true,
                  onPressed: () {
                    // Routes.homeScreen,
                    context.go(Routes.homeScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
