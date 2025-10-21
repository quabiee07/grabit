import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/utils/custom_state.dart';
import 'package:grabit_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:grabit_mobile/core/presentation/utils/snack_bar_utils.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/onboarding/presentation/manager/splash_provider.dart';
import 'package:grabit_mobile/features/onboarding/presentation/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:sprung/sprung.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends CustomState<SplashScreen>
    with SingleTickerProviderStateMixin {
  SplashProvider? _provider;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void onStart() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start at the bottom
      end: const Offset(0.0, 0.0), // End at the center
    ).animate(CurvedAnimation(parent: _controller, curve: Sprung.underDamped));

    _controller.forward();
    super.onStart();
  }

  @override
  void onStarted() {
    _provider?.listen((event) {
      logg("$event");
      if (event == -1) {
        context.pushReplacement(const OnboardingScreen());
      } else if (event == 0) {
        // context.pushNamedReplacement(LoginScreen.id);
      } else {
        // context.push(const HomeScreen());
      }
    });
    super.onStarted();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      child: Consumer<SplashProvider>(
        builder: (_, provider, __) {
          _provider ??= provider;
          return Scaffold(
            backgroundColor: theme.colorScheme.surface,
            body: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _animation,
                  child: const Center(child: SvgImage(asset: appLogo)),
                ),
                Text(
                      'Grabit',
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontSize: 48,
                        color: theme.colorScheme.onSurface,
                      ),
                    )
                    .animate(
                      onPlay: (controller) {
                        controller.forward();
                      },
                    )
                    .then(delay: 500.ms)
                    .fadeIn(duration: 1000.ms, curve: Curves.easeInExpo)
                    .slideY(
                      delay: 800.ms,
                      begin: 0.5,
                      duration: 600.ms,
                      curve: Sprung.overDamped,
                    )
                    .then(delay: 500.ms)
                    .shimmer(
                      delay: 200.ms,
                      duration: 1800.ms,
                      color: Colors.white.withValues(alpha: .5),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
