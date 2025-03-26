import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabibi_web/authentication/presentation/screens/widgets/custom_buttons.dart';
import 'package:tabibi_web/authentication/presentation/screens/widgets/custom_text_field.dart';
import 'package:tabibi_web/theme/app_colors.dart';
import 'package:tabibi_web/theme/app_fonts.dart';
import 'package:tabibi_web/theme/app_images.dart';

class SignUpDesktop extends StatelessWidget {
  const SignUpDesktop({super.key});

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
                    // Left side with form
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Logo and Title
                            SizedBox(height: 30.h),
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
                            SizedBox(height: 30.h),

                            // Welcome text
                            Text(
                              'Create Your Account',
                              style: AppStyles.styleBold32,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'Start Your Health Journey with Tabibi!',
                              style: AppStyles.styleSemiBold15,
                            ),
                            SizedBox(height: 30.h),
                            // Add your form fields here
                            // Example:
                            CustomTextField(
                              label: 'Name',
                              hint: 'Enter your name',
                            ),
                            SizedBox(height: 12.h),
                            CustomTextField(
                              label: 'Email',
                              hint: 'Enter your email address',
                            ),
                            SizedBox(height: 12.h),
                            CustomTextField(
                              label: 'Phone',
                              hint: 'Enter your phone number',
                            ),
                            SizedBox(height: 12.h),
                            CustomTextField(
                              label: 'Password',
                              hint: 'Enter Your Password',
                            ),
                            SizedBox(height: 12.h),
                            CustomTextField(
                              label: 'Confirm Password',
                              hint: 'Enter your password again',
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (bool? value) {},
                                ),
                                Text('I agree to the terms and conditions'),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            // Sign in button
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(text: "Sign In"),
                            ),
                            SizedBox(height: 10.h),

                            // Forgot password and sign up links
                            Row(
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: AppStyles.styleLight16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle
                                    ),
                                    child: Text(
                                      "Sign Up",
                                      style: AppStyles.styleLight16.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),

                    // Right side with image
                    Expanded(
                      child: Image.asset(
                        Assets.imagesSignUpView,
                        fit: BoxFit.cover,
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
