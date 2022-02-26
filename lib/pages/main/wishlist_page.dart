import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: header
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Favorite Shoes",
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    // Note: empty Wishlist
    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/image_wishlist.png",
                width: 74,
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                "You don't have dream shoes?",
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Let's find your favorite shoes",
                style: secondaryTextStyle.copyWith(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    )),
                child: Text(
                  "Explore Store",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Note: content
    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              WishlistCard(
                img: "assets/images/image_shoes.png",
                title: "Terrex Urban Low",
                price: "\$143,98",
              ),
              WishlistCard(
                img: "assets/images/image_shoes2.png",
                title: "Predator 20.3 Firm Ground Boots",
                price: "\$68,47",
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyWishlist(),
        content(),
      ],
    );
  }
}
