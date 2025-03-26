import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi_web/authentication/presentation/screens/sign_in/sign_in_screen.dart';

void main() {
  runApp(const TabibiWeb());
}

class TabibiWeb extends StatelessWidget {
  const TabibiWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SignInScreen(),
        );
      },
    );
  }
}
