import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/utils/theme/app_colors.dart' show AppColors;
import 'package:google_fonts/google_fonts.dart';

class Styles {
  Styles._privateConstructor();

  static TextStyle tsWhiteRegular18 = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontSize: 18.0,
    ),
  );

  static TextStyle tsPrimaryColorRegular18 = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 18.0,
    ),
  );

  static TextStyle h4 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );

  static TextStyle h5 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );

  static TextStyle h6 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );

  static TextStyle h7 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );

  static TextStyle tsLightBlueRegular13 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );

  static TextStyle tsSemiBold16 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.grey800,
    ),
  );

  static TextStyle tsMedium12 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.black2,
    ),
  );

  static TextStyle tsMedium14 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.greenLight,
    ),
  );

  static TextStyle tsSemiBold12 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.greyLight,
    ),
  );

  static TextStyle tsSemiBold14 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.black2,
    ),
  );

  static TextStyle tsSemiBold18 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.black2,
    ),
  );

  static TextStyle tsMedium16 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.black3,
    ),
  );

  static TextStyle tsMedium13 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.yellow09,
    ),
  );

  static TextStyle tsSemiBold13 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGreen1,
    ),
  );
}
