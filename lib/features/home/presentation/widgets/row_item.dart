import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  const RowItem({super.key, required this.left, required this.right});
  final String left;
  final String right;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          '₦$right',
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
