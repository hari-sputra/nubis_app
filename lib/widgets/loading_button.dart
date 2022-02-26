import 'package:flutter/material.dart';
import 'package:nubis_app/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: primaryTextColor,
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Loading',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
