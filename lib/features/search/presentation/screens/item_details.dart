import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/utils/helper_functions.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:grabit_mobile/features/search/presentation/widgets/size_option_card.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key, required this.name});
  final String name;

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int? _selectedIndex;
  late int _quantity;
  late double _basePrice;
  late double _totalPrice;
  int minQuantity = 0;
  int maxQuantity = 99;
  int initialQuantity = 1;

  final List<SizeOption> _sizeOptions = [
    SizeOption(count: 2, price: '2,800'),
    SizeOption(count: 4, price: '2,800'),
    SizeOption(count: 6, price: '2,800'),
  ];

  @override
  void initState() {
    super.initState();
    _quantity = initialQuantity;
    // Parse the price string to double (remove commas if present)
    _basePrice = double.parse(
      _sizeOptions[_selectedIndex ?? 0].price.replaceAll(',', ''),
    );
    _totalPrice = _basePrice * _quantity;
  }

  void _incrementQuantity() {
    if (_quantity < maxQuantity) {
      setState(() {
        _quantity++;
        _updateTotalPrice();
      });
    }
  }

  void _decrementQuantity() {
    if (_quantity > minQuantity) {
      setState(() {
        _quantity--;
        _updateTotalPrice();
      });
    }
  }

  void _updateTotalPrice() {
    setState(() {
      _totalPrice = _basePrice * _quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopWidget(),
        ),
        centerTitle: true,
        title: Text(
          'Details',
          style: theme.textTheme.displayMedium?.copyWith(fontSize: 24),
        ),
        actions: [
          Icon(Icons.favorite_border, color: textColorLight, size: 20),
          const Gap(15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: Key('fries_${widget.name}'),
                child: CustomImage(
                  asset: fries,
                  height: 240,
                  width: screenWidth(context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
                    ),
                    Text(
                      'Mexican • 20-25 min',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        Text(
                          '₦2,800',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Starting price',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        SvgImage(asset: favorite, color: amber, height: 14),
                        Text(
                          '4.8  216 reviews',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Gap(20),
            Row(
              spacing: 5,
              children: [
                SvgImage(asset: info),
                Text(
                  'Description',
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
                ),
              ],
            ),
            const Gap(10),
            Text(
              'Grilled fish tacos with fresh cabbage slaw, pico de gallo, and our signature lime crema. Served in warm corn tortillas with a side of chips and salsa.',
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Gap(20),

            Text(
              'Choose Size',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _sizeOptions.length,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      // final option = _sizeOptions[index];
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: index < _sizeOptions.length - 1 ? 12 : 0,
                      ),
                      child: SizeOptionCard(
                        tacoCount: _sizeOptions[index].count,
                        price: _sizeOptions[index].price,
                        isSelected: _selectedIndex == index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(20),
            Text(
              'Quantity',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
            const Gap(10),
            Container(
              width: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: cardGrey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Clickable(
                    onPressed: _decrementQuantity,
                    child: SvgImage(
                      asset: minus,
                      color: _quantity <= minQuantity
                          ? textColorLight.withValues(alpha: .3)
                          : textColorLight,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Text(
                      '$_quantity',
                      key: ValueKey<int>(_quantity),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: _quantity > 0
                            ? FontWeight.w500
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                  Clickable(
                    onPressed: _incrementQuantity,
                    child: SvgImage(
                      asset: add,
                      color: _quantity >= maxQuantity
                          ? textColorLight.withValues(alpha: .3)
                          : textColorLight,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        color: textGrey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '₦$_totalPrice',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        color: textColorDark,
                      ),
                    ),
                    // Price
                  ],
                ),
                Container(
                  width: 177,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Add to cart',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
