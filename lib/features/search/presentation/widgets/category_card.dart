import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.index,
  });
  final String title;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 90,
      width: 85,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              top: 9,
              left: 9,
              child: Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
              ),
            ),
            Positioned(
              bottom: index == 1 || index == 2?-10: 0,
              left:index == 1 || index == 2?5: 0,
              right: index == 1 || index == 0?5: 0,
              child: CustomImage(
                asset: image,
                width: index == 0
                    ? 97
                    : index == 1
                    ? 71
                    : 75,
                height: index == 0
                    ? 47
                    : index == 1
                    ? 69
                    : 68,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
