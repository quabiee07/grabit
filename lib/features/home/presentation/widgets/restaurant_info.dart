import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 10,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CustomImage(
            asset: mamaKitchen,
            height: 45,
            width: 53,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(
              'Mega Kitchen',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
            Row(
              spacing: 8,
              children: [
                Row(
                  spacing: 2,
                  children: [
                    SvgImage(asset: favorite, color: amber, height: 14),
                    Text(
                      '4.8 (275)',
                      style: theme.textTheme.bodySmall?.copyWith(
                        // color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 2,
                  children: [
                    SvgImage(asset: locationOutline, height: 14),
                    Text(
                      '3.1 km',
                      style: theme.textTheme.bodySmall?.copyWith(
                        // color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
