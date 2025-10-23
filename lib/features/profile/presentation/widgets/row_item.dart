import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });
  final String icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: onPressed,
      child: Row(
        spacing: 8,
        children: [
          SvgImage(asset: icon, height: 20, width: 20, color: textColorLight),
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
