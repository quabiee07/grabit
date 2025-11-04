import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class OrderTrackingStepper extends StatelessWidget {
  final int currentStep;

  const OrderTrackingStepper({super.key, this.currentStep = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // Icons and connecting lines
          Row(
            children: [
              _buildStepIcon(
                context,
                icon: tickDouble,
                isActive: currentStep >= 0,
                isCompleted: currentStep > 0,
              ),
              _buildConnectingLine(isActive: currentStep >= 1),
              _buildStepIcon(
                context,
                icon: firePit,
                isActive: currentStep >= 1,
                isCompleted: currentStep > 1,
              ),
              _buildConnectingLine(isActive: currentStep >= 2),
              _buildStepIcon(
                context,
                icon: truckFast,
                isActive: currentStep >= 2,
                isCompleted: currentStep > 2,
              ),
              _buildConnectingLine(isActive: currentStep >= 3),
              _buildStepIcon(
                context,
                icon: boxTick,
                isActive: currentStep >= 3,
                isCompleted: currentStep > 3,
              ),
            ],
          ),
          const Gap(12),
          // Labels
          Row(
            children: [
              _buildStepLabel(context, 'Confirmed', isActive: currentStep >= 0),
              const Spacer(),
              _buildStepLabel(context, 'Cooking', isActive: currentStep >= 1),
              const Spacer(),
              _buildStepLabel(
                context,
                'On the way',
                isActive: currentStep >= 2,
              ),
              const Spacer(),
              _buildStepLabel(context, 'Delivered', isActive: currentStep >= 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepIcon(
    BuildContext context, {
    required String icon,
    required bool isActive,
    required bool isCompleted,
  }) {
    return SvgImage(
      asset: icon,
      color: isActive ? primaryColor : textColorLight,
    );
  }

  Widget _buildConnectingLine({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(),
        child: Row(
          children: List.generate(
            10,
            (index) => Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                color: isActive ? primaryColor : textColorLight,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepLabel(
    BuildContext context,
    String label, {
    required bool isActive,
  }) {
    final theme = Theme.of(context);
    return Text(
      label,
      textAlign: TextAlign.center,
      style: theme.textTheme.bodySmall?.copyWith(
        fontSize: 14,
        color: isActive ? primaryColor : textColorLight,
      ),
    );
  }
}
