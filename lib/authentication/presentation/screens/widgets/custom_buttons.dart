import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi_web/theme/app_colors.dart';
import 'package:tabibi_web/theme/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 3.w, top: 6.h, bottom: 6.h),
        decoration: BoxDecoration(
          color: AppColors.primaryAuthBlue,
          borderRadius: BorderRadius.circular(30.h),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: AppStyles.styleMeduim20),
            SizedBox(width: 6.w), // Adjust spacing if needed
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 4.w,
                color: AppColors.primaryWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
