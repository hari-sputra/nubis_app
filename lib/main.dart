import 'package:flutter/material.dart';
import 'package:nubis_app/pages/checkout_page.dart';
import 'package:nubis_app/pages/checkout_success_page.dart';
import 'package:nubis_app/pages/detail_chat.dart';
import 'package:nubis_app/pages/edit_profile_page.dart';
import 'package:nubis_app/pages/main/cart_page.dart';
import 'package:nubis_app/pages/login_page.dart';
import 'package:nubis_app/pages/main/main_page.dart';
import 'package:nubis_app/pages/product_page.dart';
import 'package:nubis_app/pages/registration_page.dart';
import 'package:nubis_app/pages/spash_page.dart';
import 'package:nubis_app/provider/auth_provider.dart';
import 'package:nubis_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => LoginPage(),
          '/regis': (context) =>  RegistrationPage(),
          '/main': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChat(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
