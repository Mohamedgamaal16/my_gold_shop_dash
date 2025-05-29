import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({super.key, required this.phone});
  final String phone;

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  int _timeLeft = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timeLeft = 10; // Reset time
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft == 0) {
        timer.cancel();
      } else {
        setState(() {
          _timeLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onResendPressed() {
    print("Resending OTP to: ${widget.phone}");
    _startTimer(); // Restart the timer
  }

  @override
  Widget build(BuildContext context) {
    final showCounter = _timeLeft > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showCounter)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Code expires in: ",
                style: AppTextStyles.bodyL(context).copyWith(
                  color: AppColors.greyScaleLightGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "00:${_timeLeft.toString().padLeft(2, '0')}",
                style: AppTextStyles.bodyS(
                  context,
                ).copyWith(color: AppColors.trafficLightColorsError),
              ),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Didn't receive code?",
                style: AppTextStyles.bodyL(context).copyWith(
                  color: AppColors.greyScaleLightGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: _onResendPressed,
                child: Text(
                  "Resend OTP",
                  style: AppTextStyles.bodyS(context).copyWith(
                    color: AppColors.colorsPrimary2,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
