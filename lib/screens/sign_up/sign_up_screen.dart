import 'package:flutter/material.dart';

import '../../components/socal_card.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    "Đăng ký tài khoản",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(
                    color: Color(0xffFFAEC9),
                        fontFamily: "Muli-Bold",
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold)
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  SignUpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
