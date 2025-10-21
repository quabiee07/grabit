import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 136,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            CustomImage(
              asset: rectangle,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 20,
              left: 20,
              bottom: 20,
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Get up to\n',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: 'Get 50% Off\n',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'On all orders',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Container(
                    height: 28,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      color: textColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'Order Now',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 9,
              right: 5,
              child: CustomImage(asset: mama,
              width: 135,))
          ],
        ),
      ),
    );
  }
}
