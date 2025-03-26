import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi_web/theme/app_colors.dart';
import 'package:tabibi_web/theme/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  const CustomTextField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.styleSemiBold18),
        SizedBox(height: 2.h),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 8.w),
            hintText: hint,
            hintStyle: AppStyles.styleRegular16.copyWith(
              color: AppColors.labelField,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.h),
            ),
          ),
        ),
      ],
    );
  }
}
