import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_tab_bar.dart';
import 'package:grabit_mobile/features/orders/presentation/widgets/order_item.dart';

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
              children: List.generate(tabTitles.length, (index) {
                return ListView.separated(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return OrderItem(
                      isPending: _selectedIndex == 0,
                      isOngoing: _selectedIndex == 1,
                      isCompleted: _selectedIndex == 2,
                    );
                  },
                  separatorBuilder: (context, index) => Gap(16),
                );
              }),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
