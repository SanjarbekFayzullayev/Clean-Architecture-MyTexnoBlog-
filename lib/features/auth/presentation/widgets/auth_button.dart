import 'package:flutter/material.dart';
import 'package:texno_blog/core/theme/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

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
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(390, 56),
            backgroundColor: AppColors.transparent,
            shadowColor: AppColors.transparent),
        child: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
