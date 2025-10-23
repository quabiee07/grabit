import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/features/profile/presentation/widgets/custom_chip.dart';
import 'package:grabit_mobile/features/profile/presentation/widgets/premium_card.dart';
import 'package:grabit_mobile/features/profile/presentation/widgets/profile_image.dart';
import 'package:grabit_mobile/features/profile/presentation/widgets/row_item.dart';
import 'package:grabit_mobile/features/profile/presentation/widgets/statistic_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        forceMaterialTransparency: true,
        title: Text(
          'Profile',
          style: theme.textTheme.displayMedium?.copyWith(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileImage(),
            Text(
              'Tolulope David',
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 16,
                // fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(8),
            Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomChip(icon: appLogo, label: '9', color: cardGrey),
                CustomChip(
                  icon: favorite,
                  label: '5.0',
                  color: blue,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                ),
              ],
            ),
            const Gap(16),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: StatisticCard(
                    icon: boxFilled,
                    number: 153,
                    title: 'Orders',
                    color: amber,
                  ),
                ),
                Expanded(
                  child: StatisticCard(
                    icon: favorite,
                    number: 4.9,
                    title: 'Ratings',
                    color: blue,
                  ),
                ),
                Expanded(
                  child: StatisticCard(
                    icon: clockFilled,
                    number: 3,
                    title: 'Years',
                    color: red,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'General',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: cardGrey,
                border: Border.all(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                spacing: 10,
                children: [
                  RowItem(
                    icon: profile,
                    title: 'Personal details',
                    onPressed: () {},
                  ),
                  Divider(color: borderColor),
                  RowItem(icon: global, title: 'Language', onPressed: () {}),
                  Divider(color: borderColor),
                  RowItem(
                    icon: locationIcon,
                    title: 'Address',
                    onPressed: () {},
                  ),
                  Divider(color: borderColor),
                  RowItem(
                    icon: lock,
                    title: 'Privacy Policy',
                    onPressed: () {},
                  ),
                  Divider(color: borderColor),
                  RowItem(
                    icon: document,
                    title: 'Terms of Use',
                    onPressed: () {},
                  ),
                  Divider(color: borderColor),
                  RowItem(icon: message, title: 'Feedback', onPressed: () {}),
                ],
              ),
            ),
            const Gap(16),
            PremiumCard(),
            const Gap(16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: cardGrey,
                border: Border.all(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                spacing: 10,
                children: [
                  RowItem(
                    icon: profile,
                    title: 'Delete account',
                    onPressed: () {},
                  ),
                  Divider(color: borderColor),
                  RowItem(icon: global, title: 'Log out', onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
