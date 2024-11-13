import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          onSurface: AppColors.darkBlueColor),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          foregroundColor: AppColors.whiteColor,
          titleTextStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBlueColor,
          )),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: AppColors.whiteColor,
        headerForegroundColor: AppColors.primaryColor,
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.whiteColor,
        dialBackgroundColor: AppColors.whiteColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkBlueColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          foregroundColor: AppColors.whiteColor,
          titleTextStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          )),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, onSurface: AppColors.whiteColor),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: AppColors.darkBlueColor,
        headerForegroundColor: AppColors.primaryColor,
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.darkBlueColor,
        dialBackgroundColor: AppColors.darkBlueColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ));
}
