import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 140,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.antiAlias,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 104,
              height: 100,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CustomImage(asset: avatar, fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 80,
            right: 10,
            child: Clickable(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(),
                    );
                  },
                );
              },
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: orange,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.surface,
                    width: 1,
                  ),
                ),
                child: const Center(child: SvgImage(asset: add)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}