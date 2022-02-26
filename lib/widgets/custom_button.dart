import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final Function() onTap;
  const CustomButton({
    Key? key,
    required this.text,
    this.width = double.infinity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
