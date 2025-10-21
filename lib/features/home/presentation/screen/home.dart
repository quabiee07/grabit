import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/widgets/search_bar.dart';
import 'package:grabit_mobile/features/home/presentation/manager/home_provider.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/home_appbar.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/popular_restaurant_card.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/promo_card.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/service_card.dart';
import 'package:grabit_mobile/features/home/presentation/widgets/store_card.dart';
import 'package:provider/provider.dart';
import 'package:sprung/sprung.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeProvider? _provider;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        _provider ??= provider;
        final state = provider.state;
        return Scaffold(
          appBar: HomeAppbar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stagger index 0
                _staggered(child: const SearchBarWidget(), index: 0, total: 8),
                const Gap(16),
                Row(
                  children: List.generate(state.services.length, (index) {
                    final service = state.services[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index != state.services.length - 1 ? 12.0 : 0,
                      ),
                      child: _staggered(
                        child: ServiceCard(
                          title: service['title']!,
                          eta: service['eta']!,
                          image: service['image']!,
                          index: index,
                        ),
                        index: 1 + index,
                        total: state.services.length + 7,
                      ),
                    );
                  }),
                ),
                const Gap(16),
                // Promo as next in stagger
                _staggered(child: PromoCard(), index: 4, total: 8),
                const Gap(16),
                Text(
                  'Popular Restaurant',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(14),
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 14,
                      children: List.generate(state.restaurants.length, (
                        index,
                      ) {
                        final restaurant = state.restaurants[index];
                        return _staggered(
                          child: PopularRestaurantCard(
                            name: restaurant['name']!,
                            image: restaurant['image']!,
                            rating: restaurant['rating']!,
                            estimatedAmount: restaurant['amount']!,
                            estimatedTime: restaurant['time']!,
                          ),
                          index: 5 + index,
                          total: state.restaurants.length + 8,
                        );
                      }),
                    ),
                  ),
                ),
                const Gap(16),
                Text(
                  'Available Stores',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(14),
                SingleChildScrollView(
                  child: Column(
                    spacing: 14,
                    children: List.generate(state.stores.length, (index) {
                      final restaurant = state.stores[index];
                      return _staggered(
                        child: StoreCard(
                          name: restaurant['name']!,
                          image: restaurant['image']!,
                          rating: restaurant['rating']!,
                          estimatedAmount: restaurant['amount']!,
                          estimatedTime: restaurant['time']!,
                        ),
                        index: 8 + index,
                        total: state.stores.length + 11,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Wraps [child] with a Fade + Slide transition driven by a staggered interval
  Widget _staggered({
    required Widget child,
    required int index,
    required int total,
  }) {
    final totalDelay = 0.05; // seconds between each item

    final start = (index * totalDelay).clamp(0.0, 1.0);
    final end = (start + 0.4).clamp(0.0, 1.0);
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Sprung.criticallyDamped),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    );
  }
}
