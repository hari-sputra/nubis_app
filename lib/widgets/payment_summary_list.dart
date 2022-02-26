import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class PaymentSummaryList extends StatelessWidget {
  final String title, result;
  final EdgeInsets margin;
  final TextStyle style1, style2;
  const PaymentSummaryList({
    Key? key,
    required this.title,
    required this.result,
    this.margin = EdgeInsets.zero,
    required this.style1,
    required this.style2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: style1.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            result,
            style: style2.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
