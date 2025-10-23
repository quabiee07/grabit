import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_tab_bar.dart';
import 'package:grabit_mobile/features/orders/presentation/widgets/cart_tab.dart';
import 'package:grabit_mobile/features/orders/presentation/widgets/completed_tab.dart';
import 'package:grabit_mobile/features/orders/presentation/widgets/ongoing_tab.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedIndex = 0;
  final tabTitles = const ['Cart', 'Ongoing', 'Completed'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: theme.textTheme.displayMedium?.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(
              initialIndex: _selectedIndex,
              tabs: tabTitles,
              onTabSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [CartTab(), OngoingTab(), CompletedTab()],
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
