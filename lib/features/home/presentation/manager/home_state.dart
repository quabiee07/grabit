import 'package:grabit_mobile/core/presentation/resources/drawables.dart';

class HomeState {
  int selectedIndex = 0;
  final List<Map<String, String>> services = [
    {'title': 'Food', 'eta': '26', 'image': burger},
    {'title': 'Mart', 'eta': '26', 'image': veggies},
    {'title': 'Courier', 'eta': '26', 'image': parcel},
  ];

  final List<Map<String, String>> restaurants = [
    {
      'name': 'Burger House',
      'rating': '4.6',
      'amount': '800',
      'time': '5 - 10',
      'image': burgerCloseUp,
    },
    {
      'name': 'Suya Place',
      'rating': '4.6',
      'amount': '800',
      'time': '5 - 10',
      'image': sourCurry,
    },
    {
      'name': 'Ewa Agoyin Spot',
      'rating': '4.6',
      'amount': '800',
      'time': '5 - 10',
      'image': sourCurry,
    },
  ];
  final List<Map<String, String>> stores = [
    {
      'name': 'Burger House',
      'rating': '4.6',
      'amount': '800',
      'time': '5 - 10',
      'image': womanShopping,
    },
    {
      'name': 'Suya Place',
      'rating': '4.6',
      'amount': '800',
      'time': '5 - 10',
      'image': fruits,
    },
  ];
}
