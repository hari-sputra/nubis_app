import 'package:flutter/material.dart';
import 'package:nubis_app/pages/main/chat_page.dart';
import 'package:nubis_app/pages/main/home_page.dart';
import 'package:nubis_app/pages/main/profile_page.dart';
import 'package:nubis_app/pages/main/wishlist_page.dart';
import 'package:nubis_app/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Note: Cart Button
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          "assets/icons/icon_cart.png",
          width: 20,
        ),
      );
    }

    // Note: Custom Bottom Nav
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    "assets/icons/icon_home.png",
                    width: 21,
                    color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10, right: 60),
                  child: Image.asset(
                    "assets/icons/icon_chat.png",
                    width: 20,
                    color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10, left: 60),
                  child: Image.asset(
                    "assets/icons/icon_wishlist.png",
                    width: 20,
                    color: currentIndex == 2 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    "assets/icons/icon_profile2.png",
                    width: 18,
                    color: currentIndex == 3 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
            ],
          ),
        ),
      );
    }

    // Note: Body Content
    Widget bodyContent() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return WishlistPage();
        case 3:
          return ProfilePage();

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: bodyContent(),
    );
  }
}
