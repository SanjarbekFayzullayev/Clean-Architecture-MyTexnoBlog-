import 'package:flutter/material.dart';
import 'package:texno_blog/core/theme/app_colors.dart';

class AppTheme {
  static _border([Color color = AppColors.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(40),
      );
  static final dartThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundColor),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(28),
        enabledBorder: _border(),
        focusedBorder: _border(AppColors.gradient2),
      ));
}
