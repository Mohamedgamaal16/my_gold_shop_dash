import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_text_field.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Admin Login", style: AppTextStyles.bodyL(context)),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Phone Number",
                          style: AppTextStyles.bodyS(context),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: "Enter your Password",
                        borderRadius: 4,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        labelName: "Login",
                        onPressed: () {
                          context.go(Routes.otp);
                        },
                        isPrimary: true,
                      ),
                    ],
                  ),
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
