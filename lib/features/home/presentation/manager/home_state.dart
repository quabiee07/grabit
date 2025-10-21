import 'package:grabit_mobile/core/presentation/resources/drawables.dart';

class HomeState {
  int selectedIndex = 0;
   final List<Map<String, String>> services = [
    {
      'title': 'Food',
      'eta': '26',
      'image': burger,
    },
    {
      'title': 'Mart',
      'eta': '26',
      'image': veggies,
    },
    {
      'title': 'Courier',
      'eta': '26',
      'image': parcel,
    },
  ];
}