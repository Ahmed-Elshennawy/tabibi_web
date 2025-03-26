import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabibi_web/Home/presentation/screens/Home_patient_desktop.dart';
import 'package:tabibi_web/authentication/presentation/screens/sign_up/sign_up_desktop.dart';
import 'package:tabibi_web/authentication/presentation/screens/widgets/custom_buttons.dart';
import 'package:tabibi_web/authentication/presentation/screens/widgets/custom_text_field.dart';
import 'package:tabibi_web/theme/app_colors.dart';
import 'package:tabibi_web/theme/app_fonts.dart';
import 'package:tabibi_web/theme/app_images.dart';

class SignInDesktop extends StatelessWidget {
  const SignInDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLogin,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Left side with image
                    Expanded(
                      child: Image.asset(
                        Assets.imagesLoginView,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Right side with form
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Logo and Title
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 30.r,
                                  child: Image.asset(Assets.imagesLogo),
                                ),
                                SizedBox(width: 3.w),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 50.r,
                                  child: SvgPicture.asset(
                                    Assets.imagesTABIBI,
                                    width: 33.w,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 60.h),

                            // Welcome text
                            Text(
                              'Welcome Back To Tabibi',
                              style: AppStyles.styleBold32,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              'Welcome Back – Your Health, Just a Click Away!',
                              style: AppStyles.styleSemiBold15,
                            ),
                            SizedBox(height: 50.h),
                            // Add your form fields here
                            // Example:
                            CustomTextField(
                              label: 'Email',
                              hint: 'Enter Your Emain Address',
                            ),
                            SizedBox(height: 40.h),
                            CustomTextField(
                              label: 'Password',
                              hint: 'Enter Your Password',
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (bool? value) {},
                                ),
                                Text('Remmber My Password'),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            // Sign in button
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(text: "Sign In", onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePatientDesktop()));
                              },),
                            ),
                            SizedBox(height: 25.h),

                            // Forgot password and sign up links
                            Row(
                              children: [
                                Text(
                                  "Doesn’t have Account? ",
                                  style: AppStyles.styleLight16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpDesktop()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: AppStyles.styleLight16.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
