import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/image_shoes.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terrex Urban Low",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "\$143,98",
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/buttons/button_add.png",
                    width: 16,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "2",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    "assets/buttons/button_min.png",
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/icon_remove.png",
                width: 10,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "Remove",
                style: alertTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
