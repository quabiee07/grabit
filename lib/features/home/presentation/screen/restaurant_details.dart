import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/utils/helper_functions.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/order_progress_modal.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/restaurant_details_modal.dart';
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
  bool _showRestaurantDetails = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
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

  void _toggleSheet() {
    if (_animationController.isCompleted) {
      _animationController.reverse().then((_) {
        // Swap widget after animation completes
        setState(() {
          _showRestaurantDetails = !_showRestaurantDetails;
        });
        // Optionally animate the new widget in
        _animationController.forward();
      });
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: _showRestaurantDetails
                    ? RestuarantDetailsModal(
                        onPay: () {
                          _toggleSheet();
                        },
                      )
                    : OrderProgressModal(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
