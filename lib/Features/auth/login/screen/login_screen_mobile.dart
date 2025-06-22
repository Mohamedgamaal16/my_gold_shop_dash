// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
//
// import 'package:my_gold_dashboard/Features/auth/login/screen/cubit/login_cubit.dart';
// import 'package:my_gold_dashboard/Features/auth/login/screen/cubit/login_state.dart';
// import 'package:my_gold_dashboard/Features/auth/login/data/model/login_parameters.dart';
//
// import 'package:my_gold_dashboard/core/routes/routes.dart';
// import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
// import 'package:my_gold_dashboard/core/styles/text_styles.dart';
//
// class LoginScreenMobile extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreenMobile> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreenMobile> {
//   final _formKey = GlobalKey<FormState>();
//   final _phoneCtrl = TextEditingController();
//
//   @override
//   void dispose() {
//     _phoneCtrl.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => loginCubit(),
//       child: BlocConsumer<loginCubit, LoginState>(
//         listener: (context, state) {
//           if (state is LoginSuccessState) {
//             log('OTP from API = ${state.loginResponse.otp}');
//             context.go(
//               Routes.otp,
//               extra: {
//                 'phone': _phoneCtrl.text.trim(),
//                 'otp': state.loginResponse.otp,
//               },
//             );
//           } else if (state is LoginErrorState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         builder: (context, state) {
//           final isLoading = state is LoginLoadingState;
//
//           return Scaffold(
//             body: Stack(
//               children: [
//                 // ===== الخلفية =====
//                 Positioned.fill(
//                   child: Image.asset(
//                     'idetity/Background.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//
//                 // ===== المحتوى (مع Scroll عند الحاجة) =====
//                 SafeArea(
//                   child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       final isMobile = constraints.maxWidth < 600;
//
//                       final cardWidth = isMobile
//                           ? constraints.maxWidth * 0.9        // يشغل 90% من عرض الهاتف
//                           : constraints.maxWidth * 0.5;       // 50% على التابلت / الويب
//                       final double cappedWidth = cardWidth
//                           .clamp(0.0, 400.0)      // كلا الحدّين double
//                           .toDouble();            // يحوِّل num إلى double
//
//                       return SingleChildScrollView(
//                         padding: const EdgeInsets.symmetric(vertical: 24),
//                         child: Center(
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 'idetity/logo.png',
//                                 width: isMobile ? 160 : 200,
//                                 height: 50,
//                               ),
//                               const SizedBox(height: 40),
//
//                               // ===== بطاقة تسجيل الدخول =====
//                               Container(
//                                 width: cappedWidth ,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 24, vertical: 32),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.12),
//                                       blurRadius: 10,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Form(
//                                   key: _formKey,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.stretch,
//                                     children: [
//                                       Text('Admin Login',
//                                           textAlign: TextAlign.center,
//                                           style: AppTextStyles.bodyL(context)),
//                                       const SizedBox(height: 24),
//
//                                       Text('Phone Number',
//                                           style: AppTextStyles.bodyS(context)),
//                                       const SizedBox(height: 8),
//
//                                       TextFormField(
//                                         controller: _phoneCtrl,
//                                         keyboardType: TextInputType.phone,
//                                         inputFormatters: [
//                                           FilteringTextInputFormatter
//                                               .digitsOnly,
//                                         ],
//                                         validator: (value) {
//                                           final phone =
//                                               value?.trim() ?? '';
//                                           if (phone.length < 10 ||
//                                               phone.length > 15) {
//                                             return 'أدخل رقم هاتف صالح';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText: '01XXXXXXXXX',
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                             BorderRadius.circular(6),
//                                           ),
//                                           contentPadding:
//                                           const EdgeInsets.symmetric(
//                                               horizontal: 12, vertical: 8),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 24),
//
//                                       CustomButton(
//                                         labelName:
//                                         isLoading ? 'Loading…' : 'Login',
//                                         isPrimary: true,
//                                         onPressed: isLoading
//                                             ? null
//                                             : () {
//                                           if (_formKey.currentState!
//                                               .validate()) {
//                                             context
//                                                 .read<loginCubit>()
//                                                 .login(LoginParameters(
//                                               phone: _phoneCtrl.text
//                                                   .trim(),
//                                             ));
//                                           }
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               const SizedBox(height: 32),
//
//                               // ===== شعار الفوتر =====
//                               Image.asset(
//                                 'idetity/abs.png',
//                                 width: isMobile ? 120 : 150,
//                                 height: isMobile ? 60 : 75,
//                                 fit: BoxFit.fill,
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//
//                 // ===== مؤشر تحميل فوق الشاشة =====
//                 if (isLoading)
//                   const ColoredBox(
//                     color: Colors.black26,
//                     child: Center(child: CircularProgressIndicator()),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
