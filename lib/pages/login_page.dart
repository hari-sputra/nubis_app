import 'package:flutter/material.dart';
import 'package:nubis_app/provider/auth_provider.dart';

import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/custom_button.dart';
import 'package:nubis_app/widgets/loading_button.dart';
import 'package:nubis_app/widgets/textformfield.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // Note: handle login
    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: primaryColor,
          content: Text(
            "Login Successfully",
            style: primaryTextStyle,
          ),
        ));
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: secondaryColor,
          content: Text(
            "Login Failed",
            style: primaryTextStyle,
          ),
        ));
        setState(() {
          isLoading = false;
        });
      }
    }

    // Note: Header text
    Widget headerText() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Sign In to Countinue",
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    // Note: form login
    Widget formLogin() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note: email
            CustomTextFormField(
              title: "Email Address",
              icon: "assets/icons/icon_email.png",
              hintText: "Your Email Address",
              controller: emailController,
            ),
            SizedBox(height: 20),
            // Note: password
            CustomTextFormField(
              title: "Password",
              icon: "assets/icons/icon_password.png",
              hintText: "Your Password",
              obscureText: true,
              controller: passwordController,
            ),
          ],
        ),
      );
    }

    // Note: Signin Button
    Widget signInButton() {
      return CustomButton(
        text: "Sign In",
        onTap: handleLogin,
      );
    }

    // Note: TextButton
    Widget signUpTextButton() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/regis");
                },
                child: Text(
                  "Sign Up",
                  style: purpleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(defaultMargin),
          children: [
            headerText(),
            formLogin(),
            isLoading ? LoadingButton() : signInButton(),
            signUpTextButton(),
          ],
        ),
      ),
    );
  }
}
