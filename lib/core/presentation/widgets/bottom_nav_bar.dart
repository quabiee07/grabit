import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';
import 'package:sprung/sprung.dart';

class BottomNavBarItem {
  BottomNavBarItem({this.icon, required this.text});

  String? icon;
  String text;

  static List<BottomNavBarItem> get items => [
    BottomNavBarItem(text: 'Home', icon: homeOutline),
    BottomNavBarItem(text: 'Search', icon: searchOutline),
    BottomNavBarItem(text: 'Orders', icon: boxOutline),
    BottomNavBarItem(text: 'Profile', icon: userOutline),
  ];

  static List<BottomNavBarItem> get selectedItems => [
    BottomNavBarItem(text: 'Home', icon: homeFilled),
    BottomNavBarItem(text: 'Search', icon: searchFilled),
    BottomNavBarItem(text: 'Orders', icon: boxFilled),
    BottomNavBarItem(text: 'Profile', icon: userFilled),
  ];
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.currentIndex,
    this.items,
    this.selectedItems,
    this.height = 70.0,
    this.iconSize = 24.0,
    this.onTabSelected,
  }) {
    assert(items?.length == 2 || items?.length == 4);
  }

  final List<BottomNavBarItem>? items;
  final List<BottomNavBarItem>? selectedItems;
  final double? height;
  final double? iconSize;
  final ValueChanged<int>? onTabSelected;
  final int selectedIndex;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() =>
      // ignore: no_logic_in_create_state
      _BottomNavBarState(selectedIndex: selectedIndex);
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  var selectedIndex = 0;

  _BottomNavBarState({required this.selectedIndex});

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  _updateIndex(int index) {
    widget.onTabSelected!(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Widget> items = List.generate(
      widget.currentIndex == widget.selectedIndex
          ? widget.items!.length
          : widget.selectedItems!.length,
      (int index) {
        return _buildTabItem(
          item: widget.currentIndex == index
              ? widget.selectedItems![index]
              : widget.items![index],
          index: index,
          onPressed: _updateIndex,
          theme: theme,
        );
      },
    );

    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(width: 1, color: const Color(0xFFD3D3D5)),
        ),
      ),
      child: BottomAppBar(
        color: theme.colorScheme.surface,
        height: widget.height,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required BottomNavBarItem item,
    required ThemeData theme,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    return Clickable(
      onPressed: () {
        HapticFeedback.lightImpact();
        onPressed(index);
      },
      child: AnimatedContainer(
        height: widget.height,
        duration: const Duration(milliseconds: 500),
        curve: Sprung.underDamped,
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 1.0,
            end: 1.5,
          ).animate(CurvedAnimation(parent: _controller, curve: Sprung.overDamped)),
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgImage(
                  asset: item.icon!,
                  height: widget.iconSize,
                ),
                Text(
                  item.text,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 10,
                    color: widget.currentIndex == index
                        ? primaryColor
                        : theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
