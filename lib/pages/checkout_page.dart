import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/checkout_card.dart';
import 'package:nubis_app/widgets/payment_summary_list.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // note: header
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout Details",
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    // Note: content
    Widget content() {
      return ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(defaultMargin),
        children: [
          // Note: List Items
          Text(
            "List Items",
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          CheckoutCard(),

          // Note: address detail
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/icons/icon_store_location.png",
                          width: 40,
                        ),
                        Image.asset(
                          "assets/icons/icon_line.png",
                          height: 30,
                        ),
                        Image.asset(
                          "assets/icons/icon_your_address.png",
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Location",
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Adidas Core",
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Your Address",
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Marsemoon",
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Note: payment summary
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Summary",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                PaymentSummaryList(
                  title: "Product Quantity",
                  result: "1 Items",
                  style1: secondaryTextStyle,
                  style2: primaryTextStyle,
                  margin: EdgeInsets.only(top: 12),
                ),
                PaymentSummaryList(
                  title: "Product Price",
                  result: "\$143.98",
                  style1: secondaryTextStyle,
                  style2: primaryTextStyle,
                  margin: EdgeInsets.only(top: 12),
                ),
                PaymentSummaryList(
                  title: "Shipping",
                  result: "Free",
                  style1: secondaryTextStyle,
                  style2: primaryTextStyle,
                  margin: EdgeInsets.only(top: 12, bottom: 11),
                ),
                Divider(
                  thickness: .3,
                  color: subtitleColor,
                ),
                PaymentSummaryList(
                  title: "Total",
                  result: "\$143.98",
                  style1: priceTextStyle,
                  style2: priceTextStyle,
                  margin: EdgeInsets.only(top: 10),
                ),
              ],
            ),
          ),
          // Note: checkout button
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: .3,
            color: subtitleColor,
          ),
          SizedBox(
            height: defaultMargin,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/checkout-success', (route) => false);
            },
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              "Checkout Now",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header() as AppBar,
      body: content(),
    );
  }
}
