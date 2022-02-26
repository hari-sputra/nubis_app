import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List images = [
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
  ];
  final List familiarShoesImage = [
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
    "assets/images/image_shoes.png",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Note: indicator carousel
    Widget indicatorCarousel(int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 16 : 6,
        height: 6,
        decoration: BoxDecoration(
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    // Note: familiar shoes image
    Widget familiarShoes(String imgUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imgUrl),
          ),
        ),
      );
    }

    // Note: header
    Widget header() {
      int index = -1;

      return SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 32,
                    ),
                  ),
                  const Icon(Icons.shopping_bag),
                ],
              ),
            ),
            CarouselSlider(
              items: images
                  .map(
                    (image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicatorCarousel(index);
              }).toList(),
            ),
          ],
        ),
      );
    }

    // Note: content
    Widget content() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // Note: header
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TERREX URBAN LOW",
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Hiking",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/buttons/button_wishlist.png",
                    width: 46,
                  ),
                ],
              ),
            ),
            // Note: price
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: backgroundColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price starts from",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "\$143,98",
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            // Note: description
            Container(
              margin: EdgeInsets.all(defaultMargin),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            // Note: Familiar Shoes
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Fimiliar Shoes",
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                        children: familiarShoesImage.map((image) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0),
                        child: familiarShoes(image),
                      );
                    }).toList()),
                  ),
                ],
              ),
            ),
            // Note: Buttons
            Container(
              margin: EdgeInsets.all(defaultMargin),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/buttons/button_chat.png",
                    width: 54,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 76,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
