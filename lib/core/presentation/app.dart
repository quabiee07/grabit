import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grabit_mobile/core/presentation/manager/theme_provider.dart';
import 'package:grabit_mobile/core/presentation/utils/custom_state.dart';
import 'package:grabit_mobile/features/home/presentation/screen/dashboard.dart';
import 'package:grabit_mobile/features/onboarding/presentation/screens/onboarding.dart';
import 'package:grabit_mobile/features/onboarding/presentation/screens/splash.dart';
import 'package:provider/provider.dart';

class GrabitApp extends StatelessWidget {
  const GrabitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (_, provider, __) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  provider.isDark ? Brightness.light : Brightness.dark,
            ),
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grabit',
            theme: provider.theme,
            darkTheme: provider.darkThemeData,
            navigatorKey: navigator,
            navigatorObservers: [routeObserver],
            initialRoute: SplashScreen.id,
            routes: {
              SplashScreen.id: (context) => const SplashScreen(),
              OnboardingScreen.id: (context) => const OnboardingScreen(),
              DashboardScreen.id: (context) => const DashboardScreen(),
              // LoginScreen.id: (context) => const LoginScreen(),
              // ForgotPasswordScreen.id: (context) =>
              //     const ForgotPasswordScreen(),
              // VerifyAccountScreen.id: (context) => const VerifyAccountScreen(),
              // ChangePasswordScreen.id: (context) => const ChangePasswordScreen(),
              // ResetPasswordScreen.id: (context) => const ResetPasswordScreen(),
              // CompleteInfoScreen.id: (context) => const CompleteInfoScreen(),
              // HomeScreen.id: (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
