
import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    this.isLoading = false,
    required this.onPressed,
    this.isEnabled = true,
    this.width,
    this.height,
    this.color,
  });

  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height ?? 48,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: (!isEnabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ??
              (isLoading
                  ? secondaryColor
                  : (isEnabled ? textColorLight : secondaryColor)),
        ),
        child: isLoading == true
            ? LoadingAnimationWidget.waveDots(
                color: theme.colorScheme.surface,
                size: 28,
              )
            : Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: theme.colorScheme.surface,
                ),
              ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  const BorderButton(
      {super.key,
      required this.title,
      this.isLoading = false,
      required this.onPressed,
      this.isEnabled = true,
      this.width,
      this.height,
      this.color});

  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height ?? 48,
      width: width ?? double.infinity,
      child: OutlinedButton(
        onPressed: (!isEnabled || isLoading) ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: color ??
                  (isLoading
                      ? secondaryColor
                      : (isEnabled ? primaryColor : secondaryColor))),
        ),
        child: isLoading == true
            ? LoadingAnimationWidget.waveDots(
                color: theme.colorScheme.surface,
                size: 28,
              )
            : Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                    color: color ??
                        (isLoading
                            ? secondaryColor
                            : (isEnabled ? primaryColor : secondaryColor))),
              ),
      ),
    );
  }
}
