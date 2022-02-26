import 'package:flutter/material.dart';
import 'package:nubis_app/provider/auth_provider.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/custom_button.dart';
import 'package:nubis_app/widgets/loading_button.dart';
import 'package:nubis_app/widgets/textformfield.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController usernameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.registrasi(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: primaryColor,
          content: Text(
            "Registrasi Successfully",
            style: primaryTextStyle,
          ),
        ));
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryColor,
            content: Text(
              'Registrasi Failed!',
              style: primaryTextStyle,
            ),
          ),
        );
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
              "Sign Up",
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Register and Happy Shoping",
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    // Note: form login
    Widget formLogin() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note: full name
            CustomTextFormField(
              title: "Full Name",
              icon: "assets/icons/icon_name.png",
              hintText: "Your Full Name",
              controller: nameController,
            ),
            SizedBox(height: 20),
            // Note: username
            CustomTextFormField(
              title: "Username",
              icon: "assets/icons/icon_username.png",
              hintText: "Your Username",
              controller: usernameController,
            ),
            SizedBox(height: 20),
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
    Widget signUpButton() {
      return CustomButton(
        text: "Sign Up",
        onTap: handleSignUp,
      );
    }

    // Note: TextButton
    Widget signInTextButton() {
      return Container(
        margin: const EdgeInsets.only(top: 100),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Sign In",
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerText(),
                formLogin(),
                isLoading ? LoadingButton() : signUpButton(),
                signInTextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
