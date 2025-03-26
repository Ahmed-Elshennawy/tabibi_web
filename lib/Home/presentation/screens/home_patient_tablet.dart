// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tabibi_web/Home/presentation/screens/home_patient_desktop.dart';
// import 'package:tabibi_web/theme/app_fonts.dart';
// import 'package:tabibi_web/theme/app_images.dart';

// class HomePatientTablet extends StatelessWidget {
//   const HomePatientTablet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFFFF),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const TabletNavbar(),
//             const TabletHeroSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Tablet Navbar
// class TabletNavbar extends StatelessWidget {
//   const TabletNavbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(Assets.imagesLogo, width: 50.w),
//               SizedBox(width: 12.w),
//               SvgPicture.asset(Assets.imagesTABIBI, width: 100.w),
//             ],
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF0F0F0),
//               borderRadius: BorderRadius.circular(30.r),
//             ),
//             child: Row(
//               children: [
//                 NavbarItem(title: "Home"),
//                 NavbarItem(title: "Consultation"),
//                 NavbarItem(title: "About"),
//                 NavbarItem(title: "Contact"),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: const Color(0xFFFFFFFF),
//                 radius: 24.r,
//                 child: Image.asset(Assets.imagesPerson),
//               ),
//               SizedBox(width: 16.w),
//               CircleAvatar(
//                 backgroundColor: const Color(0xFFFFFFFF),
//                 radius: 24.r,
//                 child: SvgPicture.asset(Assets.imagesNotification),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Tablet Hero Section
// class TabletHeroSection extends StatelessWidget {
//   const TabletHeroSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'we\'re driven by one mession',
//                   style: AppStyles.styleRegular18.copyWith(
//                     color: const Color(0xFF3B3B3B),
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 Text(
//                   'Achieve the best version of your health',
//                   style: AppStyles.styleMeduim40,
//                 ),
//                 SizedBox(height: 16.h),
//                 Text(
//                   'Take the first step towards better health with personalized care.',
//                   style: AppStyles.styleRegular18.copyWith(
//                     color: const Color(0xFF3B3B3B),
//                   ),
//                 ),
//                 SizedBox(height: 24.h),
//                 Container(
//                   height: 50.h,
//                   width: 200.w,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF1C274D),
//                     borderRadius: BorderRadius.circular(25.r),
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Consultation", style: AppStyles.styleSemiBold16.copyWith(color: Colors.white)),
//                         SizedBox(width: 8.w),
//                         const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 40.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SvgPicture.asset(Assets.imagesQuotes, width: 30.w),
//                 SizedBox(height: 16.h),
//                 Text(
//                   'We\'re here to prioritize your health and well-being, making it easier than ever to connect you with trusted doctors and quality care.',
//                   style: AppStyles.styleItalic24,
//                 ),
//                 SizedBox(height: 16.h),
//                 Text('Tabibi Team', style: AppStyles.styleRegular16),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
