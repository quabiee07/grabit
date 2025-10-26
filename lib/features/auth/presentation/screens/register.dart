import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:grabit_mobile/core/presentation/widgets/button.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/input_field.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/auth/presentation/screens/login.dart';
import 'package:grabit_mobile/features/auth/presentation/widget/terms_widget.dart';
import 'package:grabit_mobile/features/home/presentation/screen/dashboard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String id = "/register-screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final country = Country.parse('ng');
  bool isAccepted = false;
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
                'Get Started',
                style: theme.textTheme.displayLarge?.copyWith(fontSize: 32),
              ),
              const Gap(8),
              Text(
                'Enter your details below to create your Grabit account.',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: 12,
                  color: textGrey,
                ),
              ),
              const Gap(27),
              Text(
                'Full name',
                style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
              ),
              const Gap(8),
              InputField(hint: 'Emmanuel Atom', onChange: (value) {}),
              const Gap(20),
              Text(
                'Email',
                style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
              ),
              const Gap(8),
              InputField(hint: 'Your email', onChange: (value) {}),
              const Gap(20),
              Text(
                'Phone Number',
                style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
              ),
              const Gap(8),
              InputField(
                hint: 'Enter phone number',
                onChange: (value) {},
                prefixIcon: Container(
                  width: 60,
                  padding: const EdgeInsets.only(left: 16),
                  child: Clickable(
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 16,
                          ),
                          searchTextStyle: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 16,
                          ),
                          bottomSheetHeight: 500,
                          borderRadius: BorderRadius.circular(14),
                          inputDecoration: InputDecoration(
                            hintText: 'Start typing to search',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: SvgImage(asset: searchOutline, height: 16),
                            ),
                          ),
                        ),
                        onSelect: (Country country) {},
                      );
                    },
                    child: Row(
                      spacing: 2,
                      children: [
                        Text(
                          country.flagEmoji,
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SvgImage(asset: arrowDown),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(8),
              Text(
                'A verification code will be sent to this number.',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: 12,
                  color: textGrey,
                  fontWeight: FontWeight.w300,
                ),
              ),
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
              const Gap(20),
              Text(
                'Confirm Password',
                style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
              ),
              const Gap(8),
              InputField(hint: 'Re-enter your password', onChange: (value) {}),
              const Gap(40),
              TermsWidget(
                selected: isAccepted,
                onPressed: () {
                  setState(() {
                    isAccepted = !isAccepted;
                  });
                },
              ),
              const Gap(18),
              Button(
                title: 'Create Account',
                onPressed: () {
                  context.pushNamedAndClear(DashboardScreen.id);
                },
                color: primaryColor,
                isEnabled: isAccepted,
              ),
              const Gap(18),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: 12,
                      color: textGrey,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 12,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamedReplacement(LoginScreen.id);
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
