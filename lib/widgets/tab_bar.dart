import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class CustomTabBar extends StatelessWidget {
  final String title;
  final Color bg, border, text;
  CustomTabBar({
    Key? key,
    required this.title,
    this.bg = Colors.transparent,
    this.border = Colors.transparent,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 40,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(
          color: border,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 13,
            fontWeight: medium,
            color: text,
          ),
        ),
      ),
    );
  }
}
