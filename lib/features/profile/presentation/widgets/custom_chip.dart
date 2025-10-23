
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.textColor,
    this.iconColor,
  });
  final String icon;
  final String label;
  final Color color;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SvgImage(asset: icon, height: 14, width: 14, color: iconColor),
          const Gap(8),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 14,
              color: textColor ?? theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
