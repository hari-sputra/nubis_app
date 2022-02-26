import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title, icon, hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.icon,
    required this.hintText,
    this.obscureText = false,required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    width: 17,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      style: primaryTextStyle,
                      controller: controller,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: subtitleTextStyle,
                      ),
                      cursorColor: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
