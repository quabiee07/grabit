import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/circle_icon.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      foregroundColor: theme.colorScheme.surface,
      backgroundColor: theme.colorScheme.surface,
      forceMaterialTransparency: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleIcon(asset: locationIcon),
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver to',
            style: theme.textTheme.bodySmall?.copyWith(
              color: textGrey,
              fontSize: 14,
            ),
          ),
          Text(
            'Lekki Lagos, Nigeria',
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 16),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleIcon(asset: bell),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);
}
