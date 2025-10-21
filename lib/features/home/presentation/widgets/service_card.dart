import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.title,
    required this.eta,
    required this.image,
    required this.index,
  });
  final String title;
  final String eta;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 120,
      width: 113,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              top: 9,
              left: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
                  ),
                  Text(
                    '$eta mins',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: textGrey,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: index == 1 || index == 2?-2: 0,
              left:index == 1 || index == 2?5: 0,
              right: index == 1 || index == 2?5: 0,
              child: CustomImage(
                asset: image,
                width: index == 0
                    ? 118
                    : index == 1
                    ? 80
                    : 80,
                height: index == 0
                    ? 58
                    : index == 1
                    ? 70
                    : 74,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
