import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class CoreModule {

  Future<SharedPreferences> preferences() {
    return SharedPreferences.getInstance();
  }
}
