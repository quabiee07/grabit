
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/helper_functions.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/delivery_address.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/food_item.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/restaurant_info.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/row_item.dart';

class RestuarantDetailsModal extends StatelessWidget {
  const RestuarantDetailsModal({super.key, required this.onPay});
  final VoidCallback onPay;

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
                children: [
                  const RestaurantInfo(),
                  const Gap(12),
                  Divider(color: borderColor),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Items',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Clickable(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgImage(
                              asset: add,
                              color: primaryColor,
                              height: 14,
                            ),
                            Text(
                              'Add more',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  FoodItem(image: egusi, name: 'Egusi Soup', price: '2,800'),
                  const Gap(16),
                  FoodItem(image: suya, name: 'Suya Plater', price: '2,800'),
                  const Gap(20),
                  DeliveryAddressCard(),
                  const Gap(20),
                  RowItem(left: 'Sub Total', right: '8,800'),
                  const Gap(10),
                  RowItem(left: 'Delivery Fee', right: '400'),
                  const Gap(10),
                  RowItem(left: 'Service Fee', right: '540'),
                  const Gap(10),
                  RowItem(left: 'Total', right: '10,000'),
                  const Gap(20),
                  Clickable(
                    onPressed: () {
                      onPay();
                    },
                    child: Container(
                      width: 240,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          'Pay ₦10,000',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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