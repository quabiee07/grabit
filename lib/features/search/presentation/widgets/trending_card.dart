import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.name,
    required this.image,
    required this.amount,
  });
  final String name;
  final String image;
  final String amount;

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
            children: [
              SizedBox(
                width: 52,
                height: 43,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CustomImage(asset: image, fit: BoxFit.cover),
                ),
              ),
              const Gap(11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '₦$amount',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: SvgImage(asset: add),
          ),
        ],
      ),
    );
  }
}
