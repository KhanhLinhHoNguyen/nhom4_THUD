import 'package:flutter/material.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                Text(
                  "CélineBook",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(45),
                      color:  Color(0xffFFAEC9),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoSlab'),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SizedBox(height: getProportionateScreenHeight(5)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
