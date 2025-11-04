import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:grabit_mobile/core/presentation/widgets/button.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/home/presentation/screen/dashboard.dart';

class CourierScreen extends StatelessWidget {
  const CourierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courier',
          style: theme.textTheme.displayMedium?.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(75),

              Container(
                height: 75,
                width: 75,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withValues(alpha: .1),
                ),
                child: SvgImage(asset: truckFast, color: primaryColor),
              ),
              const Gap(20),
              Text(
                'Send a Package',
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
              ),
              const Gap(5),

              Text(
                'Quick and reliable courier service for\nall your delivery needs',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: textGrey,
                ),
              ),
              const Gap(105),
              Row(
                spacing: 14,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: cardGrey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgImage(
                            asset: locationIcon,
                            height: 30,
                            color: textGrey,
                          ),
                          Text(
                            'Pickup Location',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'Enter pickup address',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: cardGrey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgImage(
                            asset: locationTick,
                            height: 30,
                            color: textGrey,
                          ),
                          Text(
                            'Delivery Location',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'Enter pickup address',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Button(
                title: 'Continue',
                color: primaryColor,
                onPressed: () {
                  context.pushNamedAndClear(DashboardScreen.id);
                },
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
