import 'package:grabit_mobile/core/di/core_module_container.dart';
import 'package:grabit_mobile/core/domain/utils/constants.dart';
import 'package:grabit_mobile/core/presentation/manager/custom_provider.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  SplashProvider() {
    Future.delayed(const Duration(seconds: 4), () {
      _pref.then((value) {
        if (value.getBool(onboardingKey) == null) {
          add(-1);
          return;
        }
        try {
          final token = value.getString(tokenKey);
          // currentRole = fromString(value.getString(userRoleKey) ?? '');

          final loggedInUser = value.getString(user);
          accessToken = 'Bearer $token';
          if ((token == null && loggedInUser == null) ||
              (token != null && loggedInUser == null)) {
            add(0);
            return;
          }

          if (token != null && loggedInUser != null) {
            add(1);
            return;
          }
        } catch (e) {
          Logger().d(e);
          add(0);
        }
      });
    });
  }
}
