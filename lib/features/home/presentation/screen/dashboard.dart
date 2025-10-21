import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/utils/custom_state.dart';
import 'package:grabit_mobile/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:grabit_mobile/features/home/presentation/manager/home_provider.dart';
import 'package:grabit_mobile/features/home/presentation/screen/home.dart';
import 'package:grabit_mobile/features/search/presentation/screens/search.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const String id = "/dashboard-screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends CustomState<DashboardScreen> {
  HomeProvider? _provider;
  late List<Widget> _screens;

  @override
  void onStart() {
    _screens = [
      HomeScreen(),
      SearchScreen(),
      Container(color: Colors.blue),
      Container(color: Colors.pink),
    ];
    super.onStart();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (_, provider, __) {
          _provider ??= provider;
          final state = provider.state;
          return PopScope(
            canPop: state.selectedIndex == 0,
            onPopInvokedWithResult: (value, _) async {
              if (!value) {
                provider.setIndex(0);
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Expanded(child: _screens.elementAt(state.selectedIndex)),
                ],
              ),
              bottomNavigationBar: BottomNavBar(
                selectedIndex: state.selectedIndex,
                currentIndex: state.selectedIndex,
                onTabSelected: (index) {
                  provider.setIndex(index);
                },
                items: [
                  for (final tabItem in BottomNavBarItem.items)
                    BottomNavBarItem(text: tabItem.text, icon: tabItem.icon),
                ],
                selectedItems: [
                  for (final selectedTabItem in BottomNavBarItem.selectedItems)
                    BottomNavBarItem(
                      text: selectedTabItem.text,
                      icon: selectedTabItem.icon,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
