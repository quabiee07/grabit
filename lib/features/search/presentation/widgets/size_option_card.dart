// Individual size option card
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';

class SizeOptionCard extends StatelessWidget {
  final int tacoCount;
  final String price;
  final bool isSelected;

  const SizeOptionCard({
    super.key,
    required this.tacoCount,
    required this.price,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Colors based on selection state
    final backgroundColor = isSelected
        ? primaryColor.withValues(
            alpha: 0.1,
          ) // Green background when selected
        : const Color(0xFFF3F4F6); // Light gray when not selected

    final borderColor = isSelected
        ? primaryColor // Green border when selected
        : const Color(0xFFE5E7EB); // Gray border when not selected

    final textColor = isSelected
        ? primaryColor // Green text when selected
        : Colors.black87;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Checkmark or empty space
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isSelected
                ? Container(
                    key: const ValueKey('checkmark'),
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                : SizedBox(key: const ValueKey('empty'), height: 24),
          ),
          const Gap(12),

          // Taco count
          Text(
            '$tacoCount Tacos',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 16,
              color: textColor,
            ),
          ),
          const Gap(8),

          // Price
          Text(
            '₦$price',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 14,
              color: isSelected ? primaryColor : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// Data model for size options
class SizeOption {
  final int count;
  final String price;

  SizeOption({required this.count, required this.price});
}
