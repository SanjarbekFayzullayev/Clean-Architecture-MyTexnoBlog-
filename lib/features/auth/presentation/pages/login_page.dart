import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texno_blog/core/theme/app_colors.dart';
import 'package:texno_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:texno_blog/features/auth/presentation/pages/signup_page.dart';
import 'package:texno_blog/features/auth/presentation/widgets/auth_button.dart';
import 'package:texno_blog/features/auth/presentation/widgets/auth_field.dart';

import '../../../../core/common/widget/loader.dart';
import '../../../../core/utls/show_snacbar.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // keyboard error  off
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    // TODO: implement listener

    if (state is AuthFailure) {
      showSnackBar(context, state.message);
    }
  },
  builder: (context, state) {

    if (state is AuthLoading) {
      return const Loader();
    }
    return Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign In.",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                AuthField(hintText: "Email", controller: emailController),
                const SizedBox(height: 14),
                AuthField(
                  hintText: "Password",
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 20),
                AuthButton(
                  btnText: "Sign in",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(AuthLogin(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    }
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      SignupPage.route(),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.gradient2,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  },
),
      ),
    );
  }
}
