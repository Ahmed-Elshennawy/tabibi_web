import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabibi_web/theme/app_fonts.dart';
import 'package:tabibi_web/theme/app_images.dart';

class HomePatientMobile extends StatelessWidget {
  const HomePatientMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MobileNavbar(),
            const MobileHeroSection(),
          ],
        ),
      ),
    );
  }
}

// Mobile Navbar
class MobileNavbar extends StatelessWidget {
  const MobileNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(Assets.imagesLogo, width: 40.w),
              SizedBox(width: 8.w),
              SvgPicture.asset(Assets.imagesTABIBI, width: 80.w),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Mobile Hero Section
class MobileHeroSection extends StatelessWidget {
  const MobileHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'we\'re driven by one mession',
            style: AppStyles.styleRegular16.copyWith(
              color: const Color(0xFF3B3B3B),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Achieve the best version of your health',
            style: AppStyles.styleMeduim32,
          ),
          SizedBox(height: 16.h),
          Text(
            'Take the first step towards better health with personalized care.',
            style: AppStyles.styleRegular16.copyWith(
              color: const Color(0xFF3B3B3B),
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            height: 50.h,
            width: 180.w,
            decoration: BoxDecoration(
              color: const Color(0xFF1C274D),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Consultation", style: AppStyles.styleSemiBold16.copyWith(color: Colors.white)),
                  SizedBox(width: 8.w),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Other mobile sections would follow similar patterns
// (MobileStatisticsSection, MobileAboutSection, etc.)