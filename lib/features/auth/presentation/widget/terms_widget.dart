import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/presentation/resources/drawables.dart';
import 'package:grabit_mobile/core/presentation/theme/colors/colors.dart';
import 'package:grabit_mobile/core/presentation/widgets/clickable.dart';
import 'package:grabit_mobile/core/presentation/widgets/svg_image.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({
    super.key,
    this.selected = false,
    required this.onPressed,
  });
  final bool selected;
  final VoidCallback onPressed;

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: widget.onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Container(
            height: 20,
            width: 20,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: !widget.selected ? cardGrey : primaryColor,
              shape: BoxShape.circle,
              border: !widget.selected ? Border.all(color: borderColor) : null,
            ),
            child: !widget.selected
                ? SizedBox.shrink()
                : SvgImage(asset: check),
          ),
          Text(
            'By signing up, you agree to our Terms of Service',
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: 12,
              color: !widget.selected? textGrey: textColorLight,
              fontWeight:!widget.selected? FontWeight.w300 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
