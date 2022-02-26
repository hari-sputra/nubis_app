import 'package:flutter/material.dart';
import 'package:nubis_app/models/user_model.dart';
import 'package:nubis_app/provider/auth_provider.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/item_profile.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    // Note: header
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    user.profilePhotoUrl!,
                    width: 64,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo, ${user.name}",
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        "@${user.username}",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, "/login", (route) => false),
                  child: Image.asset(
                    "assets/buttons/button_exit.png",
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Note: content
    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ItemProfile(
                text: "Edit Profile",
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
              ),
              ItemProfile(
                text: "Your Orders",
                onTap: () {},
              ),
              ItemProfile(
                text: "Help",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "General",
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ItemProfile(
                text: "Privacy & Policy",
                onTap: () {},
              ),
              ItemProfile(
                text: "Term of Service",
                onTap: () {},
              ),
              ItemProfile(
                text: "Rate App",
                onTap: () {},
              ),
            ],
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
