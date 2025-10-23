import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/features/orders/presentation/widgets/order_item.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 7,
      itemBuilder: (context, index) {
        return OrderItem(
          isPending: true,
          isOngoing: false,
          isCompleted:false,
        );
      },
      separatorBuilder: (context, index) => Gap(16),
    );
  }
}
