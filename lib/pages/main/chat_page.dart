import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: Header
    Widget header() {
      return AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        title: Text(
          "Message Support",
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    // empty chat
    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/icon_headset.png",
                width: 80,
              ),
              const SizedBox(height: 20),
              Text(
                "Opss no message yet?",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "You have never done a transaction",
                style: secondaryTextStyle,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Explore Store",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // content
    Widget content() {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail-chat');
          },
          child: Container(
            width: double.infinity,
            color: backgroundColor3,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: const [
                ChatTile(),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
