import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/auth/otp/presentation/cubit/otp_cubit.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('idetity/Background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child:
                  Image.asset('idetity/logo.png', width: 200, height: 50),
                ),
                const Spacer(),
                Center(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 32),
                    decoration:
                    BoxDecoration(color: AppColors.colorsSurface),
                    child: OtpScreenBody(phone: phone),
                  ),
                ),
                const Spacer(),
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
      ),
    );
  }
}
