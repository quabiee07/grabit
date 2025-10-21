import 'package:grabit_mobile/core/di/core_module_container.dart';
import 'package:grabit_mobile/core/domain/utils/constants.dart';
import 'package:grabit_mobile/core/presentation/manager/custom_provider.dart';
import 'package:grabit_mobile/features/onboarding/presentation/manager/onboarding_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  var state = OnboardingState();

  bool get isEnd => state.currentIndex == state.onboardingPages.length - 1;

  init() {
    state = OnboardingState();
    notifyListeners();
  }

  setIndex(value) {
    state.currentIndex = value;
    notifyListeners();
  }

  setOnboarding() {
    _pref.then((value) {
      value.setBool(onboardingKey, true);
    });
  }
}
