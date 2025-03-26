// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tabibi_app/api/services/biometric_authentication_service.dart';
// import 'package:tabibi_app/routers/app_router.dart';
// import 'package:tabibi_app/theme/app_colors.dart';
// import 'package:tabibi_app/theme/app_images.dart';
// class AuthChecker extends StatefulWidget {
//   const AuthChecker({super.key});

//   @override
//   AuthCheckerState createState() => AuthCheckerState();
// }

// class AuthCheckerState extends State<AuthChecker> {
//   final BiometricAuthService _biometricAuthService = BiometricAuthService();

//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }

//   Future<void> checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('access');

//     if (token != null && token.isNotEmpty) {
//       // Check if biometric authentication is enabled and available
//       final credentials = await _biometricAuthService.getCredentials();
//       if (credentials['email'] != null && credentials['password'] != null) {
//         // Attempt biometric login
//         final isAuthenticated = await _biometricAuthService.authenticateWithBiometrics();
//         if (isAuthenticated) {
//           GoRouter.of(context).pushReplacement(AppRouter.customNavBar);
//           return;
//         }
//       }
//       GoRouter.of(context).pushReplacement(AppRouter.customNavBar);
//     } else {
//       GoRouter.of(context).pushReplacement(AppRouter.onboardingScreen);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.homeMainColor,
//       body: SafeArea(
//         child: Center(
//           child: Image.asset(AppImages.tabibiLogo, width: 200, height: 200),
//         ),
//       ),
//     );
//   }
// }