import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/custom_image.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.initialQuantity = 1,
    this.onQuantityChanged,
    this.onTotalPriceChanged,
    this.minQuantity = 0,
    this.maxQuantity = 99,
  });
  
  final String image;
  final String name;
  final String price; // Base price as string (e.g., "2,800")
  final int initialQuantity;
  final int minQuantity;
  final int maxQuantity;
  final Function(int quantity)? onQuantityChanged;
  final Function(double totalPrice)? onTotalPriceChanged;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  late int _quantity;
  late double _basePrice;
  late double _totalPrice;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
    // Parse the price string to double (remove commas if present)
    _basePrice = double.parse(widget.price.replaceAll(',', ''));
    _totalPrice = _basePrice * _quantity;
  }

  void _incrementQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
        _updateTotalPrice();
      });
    }
  }

  void _decrementQuantity() {
    if (_quantity > widget.minQuantity) {
      setState(() {
        _quantity--;
        _updateTotalPrice();
      });
    }
  }

  void _updateTotalPrice() {
    _totalPrice = _basePrice * _quantity;
    // Notify parent widget of changes
    widget.onQuantityChanged?.call(_quantity);
    widget.onTotalPriceChanged?.call(_totalPrice);
  }

  String _formatPrice(double price) {
    // Format number with comma separator
    String priceStr = price.toStringAsFixed(0);
    String result = '';
    int count = 0;
    
    for (int i = priceStr.length - 1; i >= 0; i--) {
      if (count == 3) {
        result = ',$result';
        count = 0;
      }
      result = priceStr[i] + result;
      count++;
    }
    
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Determine if item should be shown (quantity > 0) or hidden
    final bool isVisible = _quantity > 0 || widget.minQuantity == 0;
    
    if (!isVisible) {
      return const SizedBox.shrink();
    }
    
    return Row(
      spacing: 12,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CustomImage(
            asset: widget.image,
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
                widget.name,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
              ),
              Text(
                '₦${_formatPrice(_totalPrice)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              if (_quantity > 1)
                Text(
                  '₦${_formatPrice(_basePrice)} each',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),
        Container(
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
                  color: _quantity <= widget.minQuantity 
                      ? textColorLight.withValues(alpha: .3) 
                      : textColorLight,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Text(
                  '$_quantity',
                  key: ValueKey<int>(_quantity),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    fontWeight: _quantity > 0 ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),
              ),
              Clickable(
                onPressed: _incrementQuantity,
                child: SvgImage(
                  asset: add,
                  color: _quantity >= widget.maxQuantity 
                      ? textColorLight.withValues(alpha: .3) 
                      : textColorLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// class FoodItem extends StatefulWidget {
//   const FoodItem({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//   });
//   final String image;
//   final String name;
//   final String price;

//   @override
//   State<FoodItem> createState() => _FoodItemState();
// }

// class _FoodItemState extends State<FoodItem> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Row(
//       spacing: 12,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: CustomImage(
//             asset: widget.image,
//             height: 45,
//             width: 53,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.name,
//               style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
//             ),
//             Text(
//               '₦${widget.price}',
//               style: theme.textTheme.bodySmall?.copyWith(
//                 // color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//           ],
//         ),
//         Spacer(),
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: cardGrey,
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: Row(
//             spacing: 10,
//             children: [
//               Clickable(
//                 onPressed: () {},
//                 child: SvgImage(asset: minus, color: textColorLight),
//               ),
//               Text(
//                 '1',
//                 style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
//               ),
//               Clickable(
//                 onPressed: () {},
//                 child: SvgImage(asset: add, color: textColorLight),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
