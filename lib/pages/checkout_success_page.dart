import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubis_app/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: header
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        elevation: 0,
        title: Text(
          "Checkout Success",
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    // Note: content
    Widget content() {
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
              "You made a transaction",
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Stay at home while we \nprepare your dream shoes",
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
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
              child: Text(
                "Order Other Shoes",
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xff39374B),
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              child: Text(
                "View My Order",
                style: GoogleFonts.poppins(
                  fontWeight: medium,
                  fontSize: 16,
                  color: Color(0xffB7B6BF),
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
    );
  }
}
