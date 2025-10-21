import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';

class PopularRestaurantCard extends StatelessWidget {
  const PopularRestaurantCard({
    super.key,
    required this.name,
    required this.image,
    required this.rating,
    required this.estimatedAmount,
    required this.estimatedTime,
  });
  final String name;
  final String image;
  final String rating;
  final String estimatedAmount;
  final String estimatedTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      // width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  CustomImage(
                    height: 103,
                    width: 208,
                    asset: image,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                name,
                style: theme.textTheme.titleMedium?.copyWith(
                  // color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              Icon(Icons.star, size: 14, color: Colors.amber),
              Text(
                rating,
                style: theme.textTheme.bodySmall?.copyWith(
                  // color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
              const Gap(5),
              Text(
                'From ₦$estimatedAmount | $estimatedTime min',
                style: theme.textTheme.bodySmall?.copyWith(
                  // color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
        ],
      ),
    );
  }
}
