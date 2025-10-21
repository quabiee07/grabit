import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/snack_bar_utils.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.isPending,
    required this.isOngoing,
    required this.isCompleted,
  });
  final bool isPending;
  final bool isOngoing;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      // height: 155,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardGrey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 59,
                height: 49,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomImage(asset: suya, fit: BoxFit.cover),
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      'Mega Chicken',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '₦800 | 2 items',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              isPending
                  ? Clickable(
                      onPressed: () {
                        context.showWarning('delete feature coming soon!');
                      },
                      child: SvgImage(asset: trash),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isOngoing
                            ? purple.withValues(alpha: .08)
                            : green.withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        isOngoing
                            ? 'On the way'
                            : 'Delivered',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: isOngoing
                            ? purple
                            : green,
                        ),
                      ),
                    ),
            ],
          ),
          Gap(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SvgImage(asset: bicycle),
              Expanded(
                child: Text(
                  'Delivering to X2CC UY Ozumba Mbadiwe way Eti osa Lagos',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Gap(10),
          Clickable(
            onPressed: () {
              context.showWarning('Checkout feature coming soon!');
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: isCompleted ? darkGreen : primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  isPending
                      ? 'Checkout'
                      : isOngoing
                      ? 'Track Order'
                      : 'Reorder',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
