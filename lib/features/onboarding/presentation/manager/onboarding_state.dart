import 'package:grabit_mobile/core/domain/models/onboarding_model.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';

class OnboardingState {
  int currentIndex = 0;
  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      image: onboarding1,
      title: 'Your favorite meals, all in one place.',
      description:
          'Browse hundreds of restaurants, street spots, and hidden gems right around you.',
    ),
    OnboardingModel(
      image: onboarding2,
      title: 'Track your order in real time',
      description:
          'Know exactly when your meal leaves the kitchen and when it’ll arrive — down to the minute.',
    ),
    OnboardingModel(
      image: onboarding3,
      title: 'Delivered fresh, just the way you like it.',
      description:
          'From quick bites to full feasts, we bring every meal to your doorstep, hot, fast, & full of flavor.',
    ),
  ];
}
