import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: header
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        elevation: 0,
        title: Text(
          "Your Cart",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    // Note: empty cart
    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/icon_empty_cart.png",
              width: 79,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Opss! Your Cart is Empty",
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
              style: secondaryTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
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
      );
    }

    // Note: content
    Widget content() {
      return ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          CartCard(),
          CartCard(),
        ],
      );
    }

    // Note: custom buttom nav
    Widget customBottomNav() {
      return SizedBox(
        height: 180,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "\$287,96",
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            Divider(
              thickness: .3,
              color: subtitleColor,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Continue to Checkout",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header() as AppBar,
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
