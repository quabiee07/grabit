import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';

class SocialSignUpButton extends StatelessWidget {
  const SocialSignUpButton({super.key, required this.isGoogle});
  final bool isGoogle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: dividerGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(asset: isGoogle ? google : apple, height: 22, width: 22),
          Text(
            isGoogle ? 'Google' : 'Apple',
            style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
