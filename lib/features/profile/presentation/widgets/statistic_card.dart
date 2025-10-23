import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    super.key,
    required this.icon,
    required this.number,
    required this.title,
    required this.color,
  });
  final String icon;
  final num number;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .06),
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgImage(asset: icon, height: 20, width: 20, color: color),
          const Gap(6),
          Text(
            '$number',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 16,
              // fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(6),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
