import 'package:flutter/material.dart';
import 'package:texno_blog/core/theme/app_colors.dart';
import 'package:texno_blog/features/auth/presentation/widgets/auth_button.dart';
import 'package:texno_blog/features/auth/presentation/widgets/auth_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const AuthField(hintText: "Name"),
              const SizedBox(height: 14),
              const AuthField(hintText: "Email"),
              const SizedBox(height: 14),
              const AuthField(hintText: "Password"),
              const SizedBox(height: 20),
              const AuthButton(),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
