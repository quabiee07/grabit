import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/domain/utils/utilities.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/helper_functions.dart';
import 'package:grabit_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/home/presentation/screen/courier.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/courier_details.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/delivery_address.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/order_tracking_stepper.dart';

class OrderProgressModal extends StatelessWidget {
  const OrderProgressModal({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: screenWidth(context),
      height: screenHeight(context) * .6,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const Gap(10),
          Container(
            width: 80,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardGrey,
            ),
          ),
          const Gap(14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order on it\'s way',
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 20),
                  ),
                  const Gap(5),
                  Text(
                    'Arriving by 10:34AM',
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
                  ),
                  const Gap(12),
                  Divider(color: borderColor),
                  const OrderTrackingStepper(currentStep: 2),
                  const Gap(20),
                  const CourierDetails(),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cardGrey,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Mega Kitchen',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              spacing: 2,
                              children: [
                                SvgImage(asset: locationOutline, height: 14),
                                Text(
                                  '3.1 km',
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
                        const Gap(16),
                        Row(
                          spacing: 12,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CustomImage(
                                asset: egusi,
                                height: 45,
                                width: 53,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Egusi Soup',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '₦${formatPrice(2800)}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'X1',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Row(
                          spacing: 12,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CustomImage(
                                asset: suya,
                                height: 45,
                                width: 53,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Suya Plater',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '₦${formatPrice(2800)}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'X1',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Clickable(
                    onPressed: () {
                      context.push(CourierScreen());
                    },
                    child: DeliveryAddressCard(),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
