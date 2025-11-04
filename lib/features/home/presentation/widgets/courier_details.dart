import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class CourierDetails extends StatelessWidget {
  const CourierDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 10,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CustomImage(
            asset: man,
            height: 45,
            width: 53,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Ayomide Badmus',
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
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: SvgImage(asset: call),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: SvgImage(asset: messageIcon),
        ),
      ],
    );
  }
}
