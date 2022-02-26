import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class ItemProfile extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ItemProfile({Key? key, required this.text,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: secondaryTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
