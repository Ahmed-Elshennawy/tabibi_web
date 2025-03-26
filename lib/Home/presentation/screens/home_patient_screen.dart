import 'package:flutter/material.dart';
import 'package:tabibi_web/Home/presentation/screens/home_patient_desktop.dart';
import 'package:tabibi_web/Home/presentation/screens/home_patient_mobile.dart';
import 'package:tabibi_web/widgets/adaptive_layout_widget.dart';

class HomePatientScreen extends StatelessWidget {
  const HomePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const HomePatientMobile(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const HomePatientDesktop(),
      ),
    );
  }
}
