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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? _provider;

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
                SearchBarWidget(),
                const Gap(16),
                Row(
                  children: List.generate(state.services.length, (index) {
                    final service = state.services[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index != state.services.length - 1 ? 12.0 : 0,
                      ),
                      child: ServiceCard(
                        title: service['title']!,
                        eta: service['eta']!,
                        image: service['image']!,
                        index: index,
                      ),
                    );
                  }),
                ),
                const Gap(16),
                PromoCard(),
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
                      children: List.generate(state.restaurants.length, (index) {
                        final restaurant = state.restaurants[index];
                        return PopularRestaurantCard(
                          name: restaurant['name']!,
                          image: restaurant['image']!,
                          rating: restaurant['rating']!,
                          estimatedAmount: restaurant['amount']!,
                          estimatedTime: restaurant['time']!,
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
                        return StoreCard(
                          name: restaurant['name']!,
                          image: restaurant['image']!,
                          rating: restaurant['rating']!,
                          estimatedAmount: restaurant['amount']!,
                          estimatedTime: restaurant['time']!,
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
}
