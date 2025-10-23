import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/features/orders/presentation/widgets/order_item.dart';

class OngoingTab extends StatelessWidget {
  const OngoingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 7,
      itemBuilder: (context, index) {
        return OrderItem(isPending: false, isOngoing: true, isCompleted: false);
      },
      separatorBuilder: (context, index) => Gap(16),
    );
  }
}
