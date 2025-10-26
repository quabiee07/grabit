import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/helper_functions.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/delivery_address.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/food_item.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/restaurant_info.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/row_item.dart';
import 'package:sprung/sprung.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({super.key});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Sprung.overDamped,
          ),
        );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // void _toggleSheet() {
  //   if (_animationController.isCompleted) {
  //     _animationController.reverse();
  //   } else {
  //     _animationController.forward();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomImage(
            asset: map,
            height: screenHeight(context),
            fit: BoxFit.cover,
          ),
          Positioned(left: 10, top: kToolbarHeight + 16, child: PopWidget()),
          Positioned(
            right: 80,
            top: kToolbarHeight + 85,
            child: SvgImage(asset: locationIcon, height: 30, width: 30),
          ),
          Positioned(
            right: 20,
            top: kToolbarHeight + 235,
            child: Container(
              height: 35,
              width: 35,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgImage(asset: send),
            ),
          ),

          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 14,
                          ),
                          child: Column(
                            children: [
                              const RestaurantInfo(),
                              const Gap(12),
                              Divider(color: borderColor),
                              const Gap(12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgImage(
                                          asset: add,
                                          color: primaryColor,
                                          height: 14,
                                        ),
                                        Text(
                                          'Add more',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
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
                              FoodItem(
                                image: egusi,
                                name: 'Egusi Soup',
                                price: '2,800',
                              ),
                              const Gap(16),
                              FoodItem(
                                image: suya,
                                name: 'Suya Plater',
                                price: '2,800',
                              ),
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
                              Container(
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
                              const Gap(20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
