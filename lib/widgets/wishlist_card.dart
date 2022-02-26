import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class WishlistCard extends StatelessWidget {
  final String img, title, price;
  const WishlistCard({
    Key? key,
    required this.img,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius),
            child: Image.asset(
              img,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  price,
                  style: priceTextStyle.copyWith(),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/buttons/button_wishlist_blue.png",
            width: 34,
          ),
        ],
      ),
    );
  }
}
