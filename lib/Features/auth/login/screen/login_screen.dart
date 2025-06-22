import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/auth/login/screen/cubit/login_cubit.dart';
import 'package:my_gold_dashboard/Features/auth/login/screen/cubit/login_state.dart';
import 'package:my_gold_dashboard/Features/auth/login/data/model/login_parameters.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => loginCubit(),
      child: BlocConsumer<loginCubit, LoginState>(
        listener: (context, state) {
          // Handle login success or error state
          if (state is LoginSuccessState) {
            log('OTP: ${state.loginResponse.otp}');
            context.go(
              Routes.otp,
              extra: {
                'phone': _phoneCtrl.text.trim(),
                'otp': state.loginResponse.otp,
              },
            );
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoadingState;

          return Scaffold(
            body: Stack(
              children: [
                // === Fullscreen background image ===
                Positioned.fill(
                  child: Image.asset(
                    'idetity/Background.png',
                    fit: BoxFit.cover,
                  ),
                ),

                // === Main login content layout ===
                Column(
                  children: [
                    // === Top logo ===
                    const SizedBox(height: 40),
                    Center(
                      child: Image.asset(
                        'idetity/logo.png',
                        width: 200,
                        height: 50,
                      ),
                    ),
                    const Spacer(),

                    // === Login Card Container ===
                    Center(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // === Form Title ===
                              Text('Admin Login',
                                  style: AppTextStyles.bodyL(context)),
                              const SizedBox(height: 16),

                              // === Label for Phone ===
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Phone Number',
                                  style: AppTextStyles.bodyS(context),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // === Native TextFormField (no CustomTextField) ===
                              TextFormField(
                                controller: _phoneCtrl,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  final phone = value?.trim() ?? '';
                                  if (phone.length < 10 || phone.length > 15) {
                                    return 'Please enter a valid phone number';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: '01XXXXXXXXX',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                ),
                              ),

                              const SizedBox(height: 24),

                              // === Login Button ===
                              CustomButton(
                                labelName:
                                isLoading ? 'Loading…' : 'Login',
                                isPrimary: true,
                                onPressed: isLoading
                                    ? null
                                    : () {
                                  if (_formKey.currentState!
                                      .validate()) {
                                    context.read<loginCubit>().login(
                                      LoginParameters(
                                        phone: _phoneCtrl.text.trim(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    // === Footer logo ===
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

                // === Optional loading overlay ===
                if (isLoading)
                  const ColoredBox(
                    color: Colors.black26,
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
