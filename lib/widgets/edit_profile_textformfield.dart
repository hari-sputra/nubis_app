import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class EditProfileTextformfield extends StatelessWidget {
  final String title, hintText;
  final EdgeInsets margin;
  const EditProfileTextformfield({
    Key? key,
    required this.title,
    required this.hintText, this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: secondaryTextStyle,
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            style: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
            cursorColor: primaryTextColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: primaryTextStyle.copyWith(
                fontSize: 16,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subtitleColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subtitleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
