import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nubis_app/provider/product_provider.dart';
import 'package:nubis_app/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 230,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image_splash.png"),
            ),
          ),
        ),
      ),
    );
  }
}
