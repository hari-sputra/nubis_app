import 'package:flutter/material.dart';
import 'package:nubis_app/models/user_model.dart';
import 'package:nubis_app/provider/auth_provider.dart';
import 'package:nubis_app/theme.dart';
import 'package:nubis_app/widgets/edit_profile_textformfield.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    // Note:header
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
          ),
        ],
      );
    }

    // Note: content
    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    user.profilePhotoUrl!,
                  ),
                ),
              ),
            ),
            EditProfileTextformfield(
              title: "Name",
              hintText: "${user.name}",
              margin: EdgeInsets.only(top: defaultMargin),
            ),
            EditProfileTextformfield(
              title: "Username",
              hintText: "@${user.username}",
              margin: EdgeInsets.only(top: 24),
            ),
            EditProfileTextformfield(
              title: "Email Address",
              hintText: "${user.email}",
              margin: EdgeInsets.only(top: 24, bottom: 24),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header() as AppBar,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          content(),
        ],
      ),
    );
  }
}
