import 'package:flutter/material.dart';
import 'package:nubis_app/models/product_model.dart';
import 'package:nubis_app/theme.dart';

class NewArrival extends StatelessWidget {
  final ProductModel product;
  const NewArrival({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Container(
        margin: EdgeInsets.only(top: 14, bottom: 30),
        width: double.infinity,
        height: 120,
        child: Row(
          children: [
            Container(
              width: 120,
              height: double.infinity,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: backgroundColor6,
                borderRadius: BorderRadius.circular(defaultMargin),
                image: DecorationImage(
                  image: NetworkImage(
                    product.galleries[0].url,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category.name,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  product.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 6),
                Text(
                  "\$${product.price}.0",
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
