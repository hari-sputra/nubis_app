import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubis_app/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender, hasProduct;
  const ChatBubble({
    Key? key,
    this.text = "",
    this.isSender = false,
    this.hasProduct = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: product preview

    Widget productPreview() {
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        width: 241,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? defaultRadius : 0),
            topRight: Radius.circular(isSender ? 0 : defaultRadius),
            bottomLeft: Radius.circular(defaultRadius),
            bottomRight: Radius.circular(defaultRadius),
          ),
          color: isSender ? backgroundColor5 : backgroundColor4,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.asset(
                    "assets/images/image_shoes.png",
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "COURT VISION 2.0 SHOES",
                        style: primaryTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$57,15",
                        style: priceTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Add to Cart",
                    style: purpleTextStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Buy Now",
                    style: GoogleFonts.poppins(
                      color: backgroundColor5,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPreview() : SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? defaultRadius : 0),
                      topRight: Radius.circular(isSender ? 0 : defaultRadius),
                      bottomLeft: Radius.circular(defaultRadius),
                      bottomRight: Radius.circular(defaultRadius),
                    ),
                    color: isSender ? backgroundColor5 : backgroundColor4,
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
