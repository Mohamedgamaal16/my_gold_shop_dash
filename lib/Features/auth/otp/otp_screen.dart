import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/auth/otp/otp_screen_body.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('idetity/Background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset('idetity/logo.png', width: 200, height: 50),
              ),
              const Spacer(),

              // Login Card
              Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.45,
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(color: AppColors.colorsSurface),
                  child: OtpScreenBody(phone: "01050566622"),
                ),
              ),

              const Spacer(),

              // Footer Logo
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Image.asset(
                  'idetity/abs.png',
                  width: 150,
                  height: 75,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
