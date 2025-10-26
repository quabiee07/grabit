import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:grabit_mobile/core/presentation/widgets/button.dart';
import 'package:grabit_mobile/core/presentation/widgets/input_field.dart';
import 'package:grabit_mobile/features/auth/presentation/screens/register.dart';
import 'package:grabit_mobile/features/auth/presentation/widget/social_sign_up_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = "/login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: theme.textTheme.displayLarge?.copyWith(fontSize: 32),
              ),
              const Gap(8),
              Text(
                'Enter your details below to gain access to your Grabit account.',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: 12,
                  color: textGrey,
                ),
              ),
              const Gap(40),
              Text(
                'Email',
                style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
              ),
              const Gap(8),
              InputField(hint: 'Your email', onChange: (value) {}),
              const Gap(20),
              Text(
                'Password',
                style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
              ),
              const Gap(8),
              InputField(
                hint: 'Enter your password',
                onChange: (value) {},
                isPassword: true,
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
                  ),
                ],
              ),
              const Gap(30),
              Button(title: 'Login', onPressed: () {}, color: primaryColor),
              const Gap(18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 13,
                children: [
                  Expanded(
                    child: Divider(color: dividerGrey, height: 1, thickness: 1),
                  ),
                  Text(
                    'or continue with',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: 14,
                      color: textGrey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: dividerGrey, height: 1, thickness: 1),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: SocialSignUpButton(isGoogle: true)),
                  Expanded(child: SocialSignUpButton(isGoogle: false)),
                  ],
              ),
              const Gap(16),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: 12,
                      color: textGrey,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 12,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          context.pushNamedReplacement(RegisterScreen.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
