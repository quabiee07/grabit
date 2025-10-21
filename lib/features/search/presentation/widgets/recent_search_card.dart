import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class RecentSearchCard extends StatelessWidget {
  const RecentSearchCard({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardGrey,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 6,
            children: [
              SvgImage(asset: clock),
              Text(
               name,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: textGrey,
                ),
              ),
            ],
          ),
          Clickable(
            onPressed: () {},
            child: SvgImage(asset: close),
          ),
        ],
      ),
    );
  }
}
