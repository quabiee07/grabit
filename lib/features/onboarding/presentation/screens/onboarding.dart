import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/custom_state.dart';
import 'package:grabit_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:grabit_mobile/core/presentation/widgets/button.dart';
import 'package:grabit_mobile/features/home/presentation/screen/dashboard.dart';
import 'package:grabit_mobile/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sprung/sprung.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String id = "/onboarding-screen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends CustomState<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  OnboardingProvider? _provider;
  late PageController _pageController;
  late final AnimationController _animationController;

  @override
  void onStart() {
    _pageController = PageController(initialPage: 0);
    _animationController = AnimationController(vsync: this);
    super.onStart();
  }

  @override
  void onStarted() {
    _provider?.init();
    super.onStarted();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      builder: (context, child) {
        return Consumer<OnboardingProvider>(
          builder: (_, provider, __) {
            _provider ??= provider;
            final state = provider.state;
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) {
                          provider.setIndex(value);
                        },
                        itemCount: state.onboardingPages.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: index == 0 ? 8 : 16,
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Lottie.asset(
                                    onboard1,
                                    controller: _animationController,
                                    onLoaded: (composition) {
                                      _animationController
                                        ..duration = composition.duration
                                        ..forward()
                                        ..repeat();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        // bottom: 16,
                      ),
                      child: Column(
                        children: [
                          Text(
                            state.onboardingPages[state.currentIndex].title,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.displayLarge?.copyWith(
                              fontSize: 40,
                            ),
                          ),
                          const Gap(12),
                          Text(
                            state
                                .onboardingPages[state.currentIndex]
                                .description,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const Gap(14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4,
                            children: List.generate(
                              state.onboardingPages.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Sprung.underDamped,
                                width: state.currentIndex == index ? 22 : 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: state.currentIndex == index
                                      ? primaryColor
                                      : theme.primaryColor.withValues(
                                          alpha: 0.3,
                                        ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const Gap(38),
                          Button(
                            title: provider.isEnd ? 'Continue' : 'Next',
                            onPressed: () {
                              if (provider.isEnd) {
                                // _provider?.setOnboarding();
                                context.pushNamedAndClear(DashboardScreen.id);
                              } else {
                                _pageController.animateToPage(
                                  state.currentIndex + 1,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Sprung.overDamped,
                                );
                              }
                            },
                          ),
                          const Gap(55),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
