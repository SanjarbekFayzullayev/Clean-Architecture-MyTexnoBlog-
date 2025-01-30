import 'package:flutter/material.dart';
import 'package:texno_blog/core/theme/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.gradient1,
            AppColors.gradient2,
            // AppColors.gradient1,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(390, 56),
            backgroundColor: AppColors.transparent,
            shadowColor: AppColors.transparent),
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
