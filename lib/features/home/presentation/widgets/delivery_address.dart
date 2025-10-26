
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SvgImage(asset: locationIcon),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Address',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                'Ozumba Mbadiwe way Eti osa Lagos',
                style: theme.textTheme.bodySmall?.copyWith(
                  // color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Spacer(),
          SvgImage(asset: arrowRight)
        ],
      ),
    );
  }
}
