import 'package:grabit_mobile/core/presentation/manager/custom_provider.dart';
import 'package:grabit_mobile/features/home/presentation/manager/home_state.dart';

class HomeProvider extends CustomProvider {
  var state = HomeState();

  setIndex(value) {
    state.selectedIndex = value;
    notifyListeners();
  }

  
}