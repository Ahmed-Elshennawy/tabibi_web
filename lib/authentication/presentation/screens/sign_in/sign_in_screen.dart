import 'package:flutter/material.dart';
import 'package:tabibi_web/authentication/presentation/screens/sign_in/sign_in_desktop.dart';
import 'package:tabibi_web/widgets/adaptive_layout_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const SizedBox(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SignInDesktop(),
      ),
    );
  }
}
