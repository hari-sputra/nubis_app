import 'package:flutter/material.dart';
import 'package:nubis_app/models/user_model.dart';
import 'package:nubis_app/provider/auth_provider.dart';
import 'package:nubis_app/provider/product_provider.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/new_arrival.dart';
import 'package:nubis_app/widgets/popular_product.dart';
import 'package:nubis_app/widgets/tab_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: Provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    // Note: header content
    Widget headerContent() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, ${user.name}",
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "@${user.username}",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user.profilePhotoUrl!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Note: Tab bar
    Widget tabBarContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 3,
          left: defaultMargin,
        ),
        width: double.infinity,
        height: 45,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            CustomTabBar(
              title: "All Shoes",
              bg: primaryColor,
              text: primaryTextColor,
            ),
            CustomTabBar(
              title: "Running",
              border: blackColor,
              text: subtitleColor,
            ),
            CustomTabBar(
              title: "Training",
              border: blackColor,
              text: subtitleColor,
            ),
            CustomTabBar(
              title: "Basketball",
              border: blackColor,
              text: subtitleColor,
            ),
            CustomTabBar(
              title: "Hiking",
              border: blackColor,
              text: subtitleColor,
            ),
          ],
        ),
      );
    }

    // Note: Popular Products
    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Products",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: productProvider.products
                      .map((product) => PopularProduct(
                            product: product,
                          ))
                      .toList()),
            ),
          ],
        ),
      );
    }

    // Note: New Arrivals
    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Arrivals",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      );
    }

    // Note: New arival list
    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
        ),
        child: Column(
          children: productProvider.products
              .map((product) => NewArrival(product: product))
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerContent(),
              tabBarContent(),
              popularProducts(),
              newArrivalsTitle(),
              newArrivals(),
            ],
          ),
        ),
      ),
    );
  }
}
