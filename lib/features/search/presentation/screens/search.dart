import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/input_field.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/search/presentation/widgets/category_card.dart';
import 'package:grabit_mobile/features/search/presentation/widgets/recent_search_card.dart';
import 'package:grabit_mobile/features/search/presentation/widgets/trending_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: theme.textTheme.displayMedium?.copyWith(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              hint: 'Search for restaurants and dishes',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgImage(asset: searchOutline, width: 20, height: 20),
              ),
              onChange: (value) {},
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Searches',
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
                ),
                Clickable(
                  onPressed: () {},
                  child: Text(
                    'Clear all',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      color: red,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(14),
            const RecentSearchCard(name: 'Pizza'),
            const Gap(10),
            const RecentSearchCard(name: 'Amala'),
            const Gap(16),
            Text(
              'Category',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CategoryCard(title: 'Burger', image: burger, index: 0),
                CategoryCard(title: 'Soups', image: soups, index: 1),
                CategoryCard(title: 'Breakfast', image: breakfast, index: 2),
                CategoryCard(title: 'Pastries', image: pastries, index: 3),
              ],
            ),
            const Gap(16),
            Row(
              spacing: 4,
              children: [
                SvgImage(asset: trending),
                Text(
                  'Trending',
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
                ),
              ],
            ),
            const Gap(14),
            TrendingCard(name: 'Suya Plater', image: suya, amount: '2,800'),
            const Gap(10),
            TrendingCard(name: 'Fish Tacos', image: fishTacos, amount: '2,800'),
          ],
        ),
      ),
    );
  }
}
