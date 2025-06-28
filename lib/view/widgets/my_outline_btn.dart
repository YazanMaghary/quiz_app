import 'package:flutter/material.dart';

class MYOutlineBtn extends StatelessWidget {
  final IconData icon;
  final Color bColor;
  final Color iconColor;
  final OutlinedBorder shapeBorder;
  final Function() function;
  final EdgeInsets padding;
  const MYOutlineBtn({
    Key? key,
    required this.icon,
    required this.function,
    required this.bColor,
    required this.iconColor,
    this.shapeBorder = const CircleBorder(),
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: OutlinedButton(
        onPressed: function,
        style: const ButtonStyle().copyWith(
            shape: WidgetStatePropertyAll(
              shapeBorder,
            ),
            side: WidgetStatePropertyAll(
              BorderSide(color: bColor),
            ),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(8))),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
