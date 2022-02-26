import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/chat_bubble.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: Header
    Widget header() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: backgroundColor1,
          title: Row(
            children: [
              Image.asset(
                "assets/images/image_shop_logo_online.png",
                width: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shoe Store",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Online",
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        preferredSize: const Size.fromHeight(70),
      );
    }

    // Note: product preview
    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: backgroundColor5,
          border: Border.all(
            color: primaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Image.asset(
                "assets/images/image_shoes.png",
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "COURT VISIO...",
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "\$57,15",
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/buttons/button_close.png",
              width: 22,
            ),
          ],
        ),
      );
    }

    // Note: chat input
    Widget chatInput() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productPreview(),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: backgroundColor4,
                    ),
                    child: Center(
                      child: TextFormField(
                        style: primaryTextStyle,
                        cursorColor: primaryTextColor,
                        decoration: InputDecoration.collapsed(
                          hintText: "Typle Message...",
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/buttons/button_send.png",
                  width: 45,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // Note: Content
    Widget content() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: const [
          ChatBubble(
            text: "Hi, This item is still available?",
            isSender: true,
            hasProduct: true,
          ),
          ChatBubble(
            text: "Good night, This item is only available in size 42 and 43",
            isSender: false,
          ),
          ChatBubble(
            text: "Owww, it suits me very well",
            isSender: true,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header() as PreferredSize,
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
